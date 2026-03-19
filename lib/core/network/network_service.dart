import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/auth_interceptor.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_request_body.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_methods.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

// --- Auth Interceptor ---
// This lives here or in its own file. It handles the "Bearer" token
// automatically for every request once set.

// --- Network Request Model ---
enum NetworkRequestType { GET, POST, PUT, PATCH, DELETE }

class NetworkRequest {
  const NetworkRequest({
    required this.type,
    required this.path,
    this.data,
    this.queryParams,
    this.headers,
  });

  final NetworkRequestType type;
  final String path;
  final NetworkRequestBody? data;
  final Map<String, dynamic>? queryParams;
  final Map<String, String>? headers;
}

// --- The Service ---
@singleton
class NetworkService implements NetworkMethods {
  late final Dio _dio;
  final AuthInterceptor _authInterceptor = AuthInterceptor();

  NetworkService() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiConstants.baseUrl,
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
        headers: {'content-type': 'application/json; charset=utf-8'},
      ),
    );

    // Add interceptors: Auth + Logger
    _dio.interceptors.add(_authInterceptor);
    _dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: false,
      responseBody: true,
      error: true,
    ));
  }

  /// Use this method after login to update the token globally
  void addBasicAuth(String accessToken) {
    _authInterceptor.updateToken(accessToken);
  }

  /// The main execution logic
  Future<NetworkResponse<T>> execute<T>(
    NetworkRequest request, {
    T Function(dynamic)? parser, // The "Recipe"
  }) async {
    try {
      final body = request.data?.whenOrNull(
        json: (data) => data,
        text: (data) => data,
      );

      final response = await _dio.request(
        request.path,
        data: body,
        queryParameters: request.queryParams,
        options: Options(
          method: request.type.name,
          headers: request.headers,
        ),
      );

      final rawData = response.data;

      // If a parser is provided, we use it to transform the data immediately
      if (parser != null && rawData != null) {
        return NetworkResponse.ok(parser(rawData));
      }

      // Otherwise, we return the raw data cast to T
      return NetworkResponse.ok(rawData as T);
    } on DioException catch (error) {
      return _handleDioError<T>(error);
    } catch (error) {
      return NetworkResponse.noData(error.toString());
    }
  }

  NetworkResponse<T> _handleDioError<T>(DioException error) {
    final errorText = error.message ?? "Unknown error occurred";

    if (error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.receiveTimeout) {
      return const NetworkResponse.noData("Connection timeout.");
    }

    if (error.response != null) {
      return switch (error.response!.statusCode) {
        400 => NetworkResponse.badRequest(errorText),
        401 => NetworkResponse.noAuth(errorText),
        403 => NetworkResponse.noAccess(errorText),
        404 => NetworkResponse.notFound(errorText),
        409 => NetworkResponse.conflict(errorText),
        _ => NetworkResponse.noData(errorText),
      };
    }

    return NetworkResponse.noData(errorText);
  }

  // --- Implementation of NetworkMethods ---

  @override
  Future<NetworkResponse<T>> get<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  }) {
    return execute<T>(
        NetworkRequest(
          type: NetworkRequestType.GET,
          path: path,
          queryParams: queryParams,
        ),
        parser: parser);
  }

  @override
  Future<NetworkResponse<T>> post<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  }) {
    return execute<T>(
        NetworkRequest(
            type: NetworkRequestType.POST,
            path: path,
            queryParams: queryParams,
            data: requestBody),
        parser: parser);
  }

  @override
  Future<NetworkResponse<T>> delete<T>({
    required String path,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  }) {
    return execute<T>(
        NetworkRequest(
            type: NetworkRequestType.DELETE,
            path: path,
            queryParams: queryParams),
        parser: parser);
  }

  @override
  Future<NetworkResponse<T>> patch<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  }) {
    return execute<T>(
        NetworkRequest(
            type: NetworkRequestType.PATCH,
            path: path,
            queryParams: queryParams,
            data: requestBody),
        parser: parser);
  }

  @override
  Future<NetworkResponse<T>> put<T>({
    required String path,
    NetworkRequestBody? requestBody,
    Map<String, dynamic>? queryParams,
    T Function(dynamic)? parser,
  }) {
    return execute<T>(
        NetworkRequest(
            type: NetworkRequestType.PUT,
            path: path,
            queryParams: queryParams,
            data: requestBody),
        parser: parser);
  }
}
