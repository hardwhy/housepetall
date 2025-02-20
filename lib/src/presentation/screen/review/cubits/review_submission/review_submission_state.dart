// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'review_submission_cubit.dart';

class ReviewSubmissionState extends st.StateFlag {
  final String? message;
  final String? title;
  final Review? review;
  ReviewSubmissionState({
    st.State state = st.State.init,
    this.message,
    this.title,
    this.review,
  }) : super(state);

  ReviewSubmissionState copyWith({
    st.State? state,
    String? message,
    String? title,
    Review? review,
  }) {
    return ReviewSubmissionState(
      state: state ?? this.state,
      message: message ?? this.message,
      title: title ?? this.title,
      review: review ?? this.review,
    );
  }

  @override
  bool operator ==(covariant ReviewSubmissionState other) {
    if (identical(this, other)) return true;

    return other.message == message &&
        other.title == title &&
        other.review == review;
  }

  @override
  int get hashCode => message.hashCode ^ title.hashCode ^ review.hashCode;

  @override
  String toString() =>
      'ReviewSubmissionState(message: $message, title: $title, review: $review)';
}
