class ApiResult<T> {
  bool get isSuccess => this is SuccessApiResult;
  bool get isError => this is ErrorApiResult;

  T? getData() => (this as SuccessApiResult).data;
}

class SuccessApiResult<T> extends ApiResult<T> {
  T? data;

  SuccessApiResult(this.data);
}

class ErrorApiResult<T> extends ApiResult<T> {
  Errors error;

  ErrorApiResult(this.error);
}

class Errors {}

class NetworkError extends Errors {}

class ServerError extends Errors {}
