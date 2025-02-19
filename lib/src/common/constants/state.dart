enum State { init, loading, succeed, failed }

class StateFlag {
  final State state;

  StateFlag(this.state);

  bool get isInitial => state == State.init;
  bool get isLoading => state == State.loading;
  bool get isSucceed => state == State.succeed;
  bool get isFailed => state == State.failed;
}
