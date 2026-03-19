import 'package:cleanarchitectureflutter/core/utils/error/api_error_message.dart';

/// Define a Native Sealed Result instead of using Dartz
sealed class Result<T> {
  const Result();
}

class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

class Failure<T> extends Result<T> {
  final ApiErrorMessage error;
  const Failure(this.error);
}

typedef ResultFuture<T> = Future<Result<T>>;

typedef ResultVoid = Future<Result<void>>;

typedef DataMap = Map<String, dynamic>;

typedef JsonFactory<T> = T Function(Map<String, dynamic> json);
