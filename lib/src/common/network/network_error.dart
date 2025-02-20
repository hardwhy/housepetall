enum NetworkError {
  unauthorized("Unauthorized"),
  contentNotFound("Not Found"),
  serviceTimeout("Connection Timeout"),
  serviceNotFound("Endpoint Not Found"),
  socketException("Failed host lookup"),
  unknownError("Unknown Error");

  final String message;
  const NetworkError(this.message);
}
