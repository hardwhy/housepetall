import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:housepetall/src/common/common.dart' as st;
import 'package:housepetall/src/domain/domain.dart';

part 'review_submission_state.dart';

extension ReviewSubmissionCubitExt on BuildContext {
  ReviewSubmissionCubit get reviewSubmissionCubit =>
      read<ReviewSubmissionCubit>();
}

class ReviewSubmissionCubit extends Cubit<ReviewSubmissionState> {
  ReviewSubmissionCubit() : super(ReviewSubmissionState());

  submitReview(Review review) async {
    emit(state.copyWith(state: st.State.loading));
    await Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(state: st.State.failed));
  }
}
