class ApiResponse<T> {
  T? result;
  bool success;
  Error? error;

  ApiResponse({
    required this.result,
    required this.success,
    this.error,
  });

  factory ApiResponse.success(T result) =>
      ApiResponse<T>(result: result, success: true);

  factory ApiResponse.error(Error error) =>
      ApiResponse<T>(result: null, success: false, error: error);
}

class Error {
  ErrorCause cause;
  String title;
  String description;

  Error({
    this.cause = ErrorCause.noInternet,
    this.title = "",
    this.description = "",
  });

  factory Error.noInternet(String errorTitle, {String? errorDescription}) =>
      Error(
        cause: ErrorCause.noInternet,
        title: errorTitle,
        description: errorDescription ?? "",
      );

  factory Error.apiError(String errorTitle, {String? errorDescription}) =>
      Error(
        cause: ErrorCause.apiError,
        title: errorTitle,
        description: errorDescription ?? "",
      );
}

enum ErrorCause {
  noInternet,
  apiError,
}
