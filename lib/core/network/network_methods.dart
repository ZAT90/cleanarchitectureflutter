import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';

abstract class NetworkMethods {
  Future<NetworkResponse<T>> get<T>({
   required String path,
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> post<T>({
   required String path,
    dynamic requestBody,
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> put<T>({
  required  String path,
    dynamic requestBody,
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> patch<T>({
   required String path,
    dynamic requestBody,
    Map<String, dynamic>? queryParams,
  });

  Future<NetworkResponse<T>> delete<T>({
   required String path,
    Map<String, dynamic>? queryParams,
  });
}
