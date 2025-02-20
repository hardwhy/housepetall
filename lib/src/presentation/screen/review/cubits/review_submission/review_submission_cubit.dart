// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:housepetall/src/common/common.dart' as st;
import 'package:housepetall/src/common/constants/constants.dart';
import 'package:housepetall/src/domain/domain.dart';

part 'review_submission_state.dart';

extension ReviewSubmissionCubitExt on BuildContext {
  ReviewSubmissionCubit get reviewSubmissionCubit =>
      read<ReviewSubmissionCubit>();
}

class ReviewSubmissionCubit extends Cubit<ReviewSubmissionState> {
  final SubmitReviewUsecase submitReviewUsecase;
  ReviewSubmissionCubit(
    this.submitReviewUsecase,
  ) : super(ReviewSubmissionState());

  submitReview(Review review) async {
    try {
      emit(state.copyWith(state: st.State.loading));
      final result = await submitReviewUsecase(review);
      emit(state.copyWith(state: st.State.succeed, review: result));
    } on APIError catch (e) {
      emit(state.copyWith(
        state: st.State.failed,
        message: e.message,
        title: e.errorType?.message,
      ));
    } catch (e) {
      emit(state.copyWith(state: st.State.failed));
    }
  }
}
