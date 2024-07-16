import 'package:cleanarchitectureflutter/core/constants/api_constants.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_request_body.dart';
import 'package:cleanarchitectureflutter/core/network/models/network_response.dart';
import 'package:cleanarchitectureflutter/core/network/network_methods.dart';
import 'package:cleanarchitectureflutter/core/utils/logger.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

class AccessTokenResponse {
  String? accessToken;
  AccessTokenResponse.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
  }
}

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

class _PreparedNetworkRequest<Model> {
  const _PreparedNetworkRequest(
    this.request,
    // this.parser,
    this.dio,
    this.headers,
    this.onSendProgress,
    this.onReceiveProgress,
  );
  final NetworkRequest request;
  // final Model Function(dynamic) parser;
  final Dio dio;
  final Map<String, dynamic> headers;
  final ProgressCallback? onSendProgress;
  final ProgressCallback? onReceiveProgress;
}

Future<NetworkResponse<Model>> executeRequest<Model>(
  _PreparedNetworkRequest preparedNetworkRequest,
) async {
  try {
    // print(
    //     '_PreparedNetworkRequest request data: ${preparedNetworkRequest.request.data}');
    // print(
    //     '_PreparedNetworkRequest request headers: ${preparedNetworkRequest.dio.options.baseUrl}');
    //     print(
    //     '_PreparedNetworkRequest request path: ${preparedNetworkRequest.request.path}');

    dynamic body = preparedNetworkRequest.request.data?.whenOrNull(
      json: (data) => data,
      text: (data) => data,
    );
    final response = await preparedNetworkRequest.dio.request(
      preparedNetworkRequest.request.path,
      data: body,
      queryParameters: preparedNetworkRequest.request.queryParams,
      options: Options(
        method: preparedNetworkRequest.request.type.name,
        headers: preparedNetworkRequest.headers,
      ),
      onSendProgress: preparedNetworkRequest.onSendProgress,
      onReceiveProgress: preparedNetworkRequest.onReceiveProgress,
    );
    // print('response _preparedNetworkRequest: ${response.data}');
    return NetworkResponse.ok(response.data);
  } on DioException catch (error) {
    print('error: ${error}');
    final errorText = error.toString();
    if (error.requestOptions.cancelToken != null &&
        error.requestOptions.cancelToken!.isCancelled) {
      return NetworkResponse.noData(errorText);
    }
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.sendTimeout:
        return const NetworkResponse.noData(
            "Connection timeout. Please try again.");
      case DioExceptionType.badResponse:
        logger.d('badResponse detected');
        switch (error.response?.statusCode) {
          case 400:
            return NetworkResponse.badRequest(errorText);
          case 401:
            return NetworkResponse.noAuth(errorText);
          case 403:
            return NetworkResponse.noAccess(errorText);
          case 404:
            return NetworkResponse.notFound(errorText);
          case 409:
            return NetworkResponse.conflict(errorText);
          default:
            return NetworkResponse.noData(errorText);
        }
      case DioExceptionType.cancel:
        return const NetworkResponse.noData("Request was cancelled.");
      case DioExceptionType.unknown:
        if (error.message!.contains("SocketException")) {
          return const NetworkResponse.noData(
              "No internet connection. Please check your network settings.");
        }
        return NetworkResponse.noData(errorText);
      default:
        return NetworkResponse.noData(errorText);
    }
    // switch (error.response?.statusCode) {
    //   case 400:
    //     return NetworkResponse.badRequest(errorText);
    //   case 401:
    //     return NetworkResponse.noAuth(errorText);
    //   case 403:
    //     return NetworkResponse.noAccess(errorText);
    //   case 404:
    //     return NetworkResponse.notFound(errorText);
    //   case 409:
    //     return NetworkResponse.conflict(errorText);
    //   default:
    //     return NetworkResponse.noData(errorText);
    // }
  } catch (error) {
    return NetworkResponse.noData(error.toString());
  }
}

@singleton
class NetworkService implements NetworkMethods {
  // NetworkService({
  //   dioClient,
  //   httpHeaders,
  // })  : _dio = dioClient,
  //       _headers = httpHeaders ?? {};
  Dio? _dio;
  //String baseUrl = ApiConstants.baseUrl;
  String baseUrl = ApiConstants.baseUrl;
  final Map<String, String> _headers = <String, String>{};
  Future<Dio> _getDefaultDioClient() async {
    _headers['content-type'] = 'application/json; charset=utf-8';
    Dio dio = Dio()
      ..options.baseUrl = baseUrl
      ..options.headers = _headers
      ..options.connectTimeout = const Duration(seconds: 5000) // 5 seconds
      ..options.receiveTimeout = const Duration(seconds: 3000); // 3 seconds
    return dio;
  }

  void addBasicAuth(String accessToken) {
    _headers['Authorization'] = 'Bearer $accessToken';
  }

  Future<NetworkResponse<Model>> execute<Model>(
    NetworkRequest request,
    // Model Function(dynamic) parser,
    {
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    _dio = await _getDefaultDioClient();
    // print('_dio: ${_dio!.options.baseUrl}');
    // print('_headers: $_headers');
    // print('request: ${request.path}');

    final req = _PreparedNetworkRequest<Model>(
      request,
      //  parser,
      _dio!,
      {..._headers, ...(request.headers ?? {})},
      onSendProgress,
      onReceiveProgress,
    );
    final result = await executeRequest<Model>(
      req,
    );
    // final result = await compute(
    //   executeRequest<Model>,
    //   req,
    // );
    return result;
  }

  @override
  Future<NetworkResponse<T>> delete<T>(
      {required String path, Map<String, dynamic>? queryParams}) async {
    final request = NetworkRequest(
      type: NetworkRequestType.DELETE,
      path: path,
      queryParams: queryParams,
    );

    return execute<T>(
      request,
    );
  }

  @override
  Future<NetworkResponse<T>> get<T>(
      {required String path, Map<String, dynamic>? queryParams}) {
    final request = NetworkRequest(
      type: NetworkRequestType.GET,
      path: path,
      queryParams: queryParams,
    );

    return execute<T>(
      request,
    );
  }

  @override
  Future<NetworkResponse<T>> patch<T>(
      {required String path, requestBody, Map<String, dynamic>? queryParams}) {
    final request = NetworkRequest(
        type: NetworkRequestType.PATCH,
        path: path,
        queryParams: queryParams,
        data: requestBody);

    return execute<T>(
      request,
    );
  }

  @override
  Future<NetworkResponse<T>> post<T>(
      {required String path, requestBody, Map<String, dynamic>? queryParams}) {
    final request = NetworkRequest(
        type: NetworkRequestType.POST,
        path: path,
        queryParams: queryParams,
        data: requestBody);

    return execute<T>(
      request,
    );
  }

  @override
  Future<NetworkResponse<T>> put<T>(
      {required String path, requestBody, Map<String, dynamic>? queryParams}) {
    final request = NetworkRequest(
      type: NetworkRequestType.PUT,
      path: path,
      queryParams: queryParams,
    );

    return execute<T>(
      request,
    );
  }
}

// Future<NetworkResponse<Model>> execute<Model>(
//   NetworkRequest request,
//   Model Function(Map<String, dynamic>) parser, {
//   ProgressCallback? onSendProgress = null,
//   ProgressCallback? onReceiveProgress = null,
// }) async {
//   if (_dio == null) {
//     _dio = await _getDefaultDioClient();
//   }
//   final req = _PreparedNetworkRequest<Model>(
//     request,
//     parser,
//     _dio!,
//     {..._headers, ...(request.headers ?? {})},
//     onSendProgress,
//     onReceiveProgress,
//   );
//   final result = await compute(
//     executeRequest<Model>,
//     req,
//   );
//   return result;
// }
