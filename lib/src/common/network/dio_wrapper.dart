import 'dart:io';

import 'package:dio/dio.dart';
import 'package:housepetall/src/common/constants/constants.dart';
import 'package:housepetall/src/common/network/network_error.dart';

mixin DioWrapper {
  Future<T> exec<T>(Future<T> Function() post) async {
    late T result;
    try {
      result = await post();
    } on DioException catch (ex) {
      NetworkError? errorType;

      if (ex.error is SocketException) {
        errorType = NetworkError.socketException;
      }

      if (ex.type == DioExceptionType.connectionTimeout) {
        errorType = NetworkError.serviceTimeout;
      }

      if (ex.response != null) {
        String? errorMessage;
        if (ex.response!.statusCode == 404) {
          errorType = NetworkError.serviceNotFound;
        } else if (ex.response!.statusCode == 401) {
          errorType = NetworkError.unauthorized;
        } else {
          errorType = NetworkError.unknownError;
        }

        if (ex.response!.data['message'] != null) {
          final backendResponse = ex.response!.data['message'];
          errorMessage = backendResponse;
        } else {
          errorMessage = ex.message;
        }
        throw APIError(
          message: errorMessage ?? 'Unknown Error',
          statusCode: ex.response?.statusCode,
          errorType: errorType,
        );
      }
    }

    return result;
  }
}
