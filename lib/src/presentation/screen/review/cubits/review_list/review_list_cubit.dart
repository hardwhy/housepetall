import 'package:bloc/bloc.dart';
import 'package:housepetall/src/common/common.dart';
import 'package:housepetall/src/domain/domain.dart';
import 'package:flutter/foundation.dart';

part 'review_list_state.dart';

class ReviewListCubit extends Cubit<ReviewListState> {
  final GetReviewsUsecase getReviewsUsecase;
  ReviewListCubit(this.getReviewsUsecase) : super(ReviewListState());

  getReviews() async {
    try {
      emit(state.copyWith(state: State.loading));
      final result = await getReviewsUsecase();
      emit(state.copyWith(
        state: State.succeed,
        reviews: result,
      ));
    } on APIError catch (e) {
      emit(state.copyWith(
        state: State.failed,
        message: e.message,
        title: e.errorType?.message,
      ));
    } catch (e) {
      emit(state.copyWith(state: State.failed));
    }
  }
}
