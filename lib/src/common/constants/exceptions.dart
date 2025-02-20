import 'package:housepetall/src/common/network/network_error.dart';

class APIError {
  final String message;
  final NetworkError? errorType;
  final int? statusCode;
  APIError({
    required this.message,
    this.statusCode,
    this.errorType,
  });
}
