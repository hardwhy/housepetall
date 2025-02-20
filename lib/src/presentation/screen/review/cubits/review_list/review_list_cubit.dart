import 'package:bloc/bloc.dart';
import 'package:housepetall/src/common/common.dart';
import 'package:housepetall/src/domain/domain.dart';
import 'package:flutter/foundation.dart';

part 'review_list_state.dart';

final dummyReviews = List.generate(5, (index) {
  final id = index + 1;
  return Review(
      id: '$id',
      rating: id,
      ownerName: 'Owner #$id',
      petName: 'Anabul #$id',
      comment:
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.");
});

class ReviewListCubit extends Cubit<ReviewListState> {
  ReviewListCubit() : super(ReviewListState());

  getReviews() {
    emit(state.copyWith(state: State.loading));
    Future.delayed(const Duration(seconds: 2));
    emit(state.copyWith(
      state: State.succeed,
      reviews: dummyReviews,
    ));
  }
}
