// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:housepetall/src/domain/domain.dart';
import 'package:housepetall/src/localization/localization.dart';
import 'package:housepetall/src/presentation/layouts/src/basic.dart';
import 'package:housepetall/src/presentation/screen/review/cubits/review_submission/review_submission_cubit.dart';
import 'package:housepetall/src/presentation/screen/review/widgets/widgets.dart';
import 'package:housepetall/src/presentation/widgets/src/modal/exit_confirmation_modal.dart';
import 'package:housepetall/src/presentation/widgets/widgets.dart';

class DirtyFormState {
  final Review defaultValues;
  final Review values;
  DirtyFormState({
    required this.defaultValues,
  }) : values = defaultValues;

  DirtyFormState._({
    required this.defaultValues,
    required this.values,
  });

  bool get rating => defaultValues.rating != values.rating;
  bool get ownerName => defaultValues.ownerName != values.ownerName;
  bool get petName => defaultValues.petName != values.petName;
  bool get comment => defaultValues.comment != values.comment;
  bool get isDirty => rating || ownerName || petName || comment;

  DirtyFormState copyWith({
    Review? values,
  }) {
    return DirtyFormState._(
      values: values ?? this.values,
      defaultValues: defaultValues,
    );
  }

  @override
  String toString() =>
      'DirtyFormState(defaultValues: $defaultValues, values: $values)';
}

class ReviewSubmission extends StatelessWidget {
  const ReviewSubmission({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final submitReviewUsecase = context.read<SubmitReviewUsecase>();
        return ReviewSubmissionCubit(submitReviewUsecase);
      },
      child: BlocListener<ReviewSubmissionCubit, ReviewSubmissionState>(
        listener: (context, state) {
          if (state.isLoading) {
            showLoadingModal(context: context);
          }
          if (state.isSucceed) {
            Navigator.pop(context);
            showSuccessSubmissionSheet(context: context);
          }
          if (state.isFailed) {
            Navigator.pop(context);
            showFailedSubmissionSheet(context: context);
          }
        },
        child: const _ReviewSubmission(),
      ),
    );
  }
}

class _ReviewSubmission extends StatefulWidget {
  const _ReviewSubmission();
  @override
  State<_ReviewSubmission> createState() => _ReviewSubmissionState();
}

class _ReviewSubmissionState extends State<_ReviewSubmission> {
  late GlobalKey<FormState> _formKey;
  late TextEditingController _nameController;
  late TextEditingController _petNameController;
  late TextEditingController _commentController;
  late int _rating;
  late ValueNotifier<DirtyFormState> _dirty;

  Review get _reviewValues => _dirty.value.values;

  @override
  void initState() {
    super.initState();
    _rating = 0;
    _formKey = GlobalKey<FormState>();
    _nameController = TextEditingController();
    _petNameController = TextEditingController();
    _commentController = TextEditingController();
    _dirty = ValueNotifier<DirtyFormState>(
      DirtyFormState(
        defaultValues: Review(
          rating: _rating,
          ownerName: _nameController.text,
          petName: _petNameController.text,
          comment: _commentController.text,
        ),
      ),
    );
    _initListener();
  }

  _initListener() {
    _nameController.addListener(() {
      _updateDirtyValue(
          _reviewValues.copyWith(ownerName: _nameController.text));
    });
    _commentController.addListener(() {
      _updateDirtyValue(
          _reviewValues.copyWith(comment: _commentController.text));
    });
    _petNameController.addListener(() {
      _updateDirtyValue(
          _reviewValues.copyWith(petName: _petNameController.text));
    });
  }

  _updateDirtyValue(Review review) {
    final newDirty = _dirty.value.copyWith(values: review);
    _dirty.value = newDirty;
  }

  @override
  void dispose() {
    _nameController.dispose();
    _petNameController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      context.reviewSubmissionCubit.submitReview(_reviewValues);
    }
  }

  String? _validateRequiredField(String? value) {
    if (value?.isEmpty ?? true) {
      return context.strings.reviewFormRequiredError;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BasicLayout(
      onBack: () {
        if (_dirty.value.isDirty) {
          showExitConfirmationSheet(context: context);
          return;
        }
        Navigator.pop(context);
      },
      title: context.strings.reviewFormTitle,
      footer: ValueListenableBuilder(
          valueListenable: _dirty,
          builder: (context, value, child) {
            return ReviewFooter(
              onTap: value.isDirty ? _submitForm : null,
              title: context.strings.reviewFormSubmitButton,
            );
          }),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: RatingFormField(
                  validator: (value) {
                    if (value == null || value <= 0) {
                      return context.strings.reviewFormRequiredError;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _updateDirtyValue(_reviewValues.copyWith(rating: value));
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Input(
                      controller: _nameController,
                      label: context.strings.reviewFormNameLabel,
                      mandatory: true,
                      placeholder: context.strings.reviewFormNamePlaceHolder,
                      validator: _validateRequiredField,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: Input(
                      controller: _petNameController,
                      label: context.strings.reviewFormPetsNameLabel,
                      mandatory: true,
                      placeholder:
                          context.strings.reviewFormPetsNamePlaceHolder,
                      validator: _validateRequiredField,
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Input(
                controller: _commentController,
                label: context.strings.reviewFormCommentLabel,
                placeholder: context.strings.reviewFormCommentPlaceHolder,
                minLine: 5,
                maxLine: null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
