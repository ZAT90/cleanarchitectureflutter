import 'package:cleanarchitectureflutter/core/network/models/network_request_body.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';

abstract class NetworkMethods {
  Future<NetworkResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  });

  Future<NetworkResponse<T>> post<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  });

  Future<NetworkResponse<T>> put<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  });

  Future<NetworkResponse<T>> patch<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  });

  Future<NetworkResponse<T>> delete<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  });
}
