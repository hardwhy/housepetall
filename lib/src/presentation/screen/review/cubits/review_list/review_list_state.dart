// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'review_list_cubit.dart';

class ReviewListState extends StateFlag {
  final List<Review> reviews;
  final String? message;
  final String? title;
  ReviewListState({
    State state = State.init,
    this.reviews = const [],
    this.message,
    this.title,
  }) : super(state);

  ReviewListState copyWith({
    List<Review>? reviews,
    String? message,
    String? title,
    State? state,
  }) {
    return ReviewListState(
      reviews: reviews ?? this.reviews,
      message: message ?? this.message,
      title: title ?? this.title,
      state: state ?? this.state,
    );
  }

  @override
  bool operator ==(covariant ReviewListState other) {
    if (identical(this, other)) return true;
  
    return 
      listEquals(other.reviews, reviews) &&
      other.message == message &&
      other.title == title;
  }

  @override
  int get hashCode => reviews.hashCode ^ message.hashCode ^ title.hashCode;
}
