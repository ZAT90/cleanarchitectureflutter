import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  String? _token;

  // Method to update the token (e.g., after login)
  void updateToken(String? token) => _token = token;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (_token != null) {
      options.headers['Authorization'] = 'Bearer $_token';
    }
    // Continue the request
    super.onRequest(options, handler);
  }
}
