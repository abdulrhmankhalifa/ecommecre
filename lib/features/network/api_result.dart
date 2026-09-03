class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;
  bool get isError => this is ErrorApiResult;

  String get errorMessage => (this as ErrorApiResult).error.message;
  T? getData() => (this as SuccessApiResult).data;
}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;

  SuccessApiResult({required this.data});
}

class ErrorApiResult<T> extends ApiResult<T> {
  Errors error;

  ErrorApiResult({required this.error});
}

class Errors {
  String message;

  Errors({required this.message});
}

class NetworkError extends Errors {
  NetworkError()
    : super(message: "Network error, please check your internet connection");
}

class ServerError extends Errors {
  ServerError({
    String? message = "Something went wrong, please try again later",
  }) : super(
         message: message ?? "Something went wrong, please try again later",
       );
}
