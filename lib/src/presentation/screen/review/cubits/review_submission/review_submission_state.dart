// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'review_submission_cubit.dart';

class ReviewSubmissionState extends st.StateFlag {
  ReviewSubmissionState({
    st.State state = st.State.init,
  }) : super(state);

  ReviewSubmissionState copyWith({
    st.State? state,
  }) {
    return ReviewSubmissionState(
      state: state ?? this.state,
    );
  }
}
