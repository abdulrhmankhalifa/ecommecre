import 'package:dio/dio.dart';
import 'package:ecommerce/features/network/api_result.dart';

ApiResult<T> handelApiError<T>(DioException e) {
  switch (e.type) {
    case DioExceptionType.connectionTimeout ||
        DioExceptionType.receiveTimeout ||
        DioExceptionType.connectionError ||
        DioExceptionType.sendTimeout:
      return ErrorApiResult(error: NetworkError());
    case DioExceptionType.badResponse:
      return ErrorApiResult(
        error: ServerError(message: e.response?.data['message']),
      );
    default:
      return ErrorApiResult(error: ServerError());
  }
}
