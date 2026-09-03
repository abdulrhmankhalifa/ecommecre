class Resource<T> {
  String errorMessage = '';

  T? data;

  Status status = Status.initial;

  Resource.initial();

  Resource.loading({this.errorMessage = '', this.data}) {
    status = Status.loading;
  }

  Resource.success({this.errorMessage = '', this.data}) {
    status = Status.success;
  }

  Resource.error({this.errorMessage = '', this.data}) {
    status = Status.error;
  }
}

enum Status { initial, loading, success, error }
