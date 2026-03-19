import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';
import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';

extension NetworkResponseX<T> on NetworkResponse<T> {
  T getOrThrow() {
    return switch (this) {
      // 1. Extract the data and cast it to our expected type T
      Ok<T>(data: final d) => d,

      // 2. Extract the message 'm' from every error case
      InvalidParameters<T>(message: final m) =>
        throw ApiErrorMessage(errorMessage: m),
      NoAuth<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
      NoAccess<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
      BadRequest<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
      NotFound<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
      Conflict<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
      NoData<T>(message: final m) => throw ApiErrorMessage(errorMessage: m),
    };
  }
}
