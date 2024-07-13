import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';

abstract class NetworkMethods {
  Future<NetworkResponse<T>> get<T>(
    String path,
    T Function(dynamic) parser, {
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> post<T>(
    String path,
    dynamic requestBody,
    T Function(dynamic) parser, {
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> put<T>(
    String path,
    dynamic requestBody,
    T Function(dynamic) parser, {
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> patch<T>(
    String path,
    dynamic requestBody,
    T Function(dynamic) parser, {
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> delete<T>(
    String path,
    T Function(dynamic) parser, {
    Map<String, dynamic>? queryParams,
  });
}
