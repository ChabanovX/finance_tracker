import 'package:dio/dio.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:yndx_homework/core/network/isolate_deserializer_interceptor.dart';

import 'retry_interceptor.dart';

class NetworkClient {
  static const String _baseUrl = 'https://shmr-finance.ru/api/v1/';
  static const Duration _connectTimeout = Duration(seconds: 5);
  static const Duration _receiveTimeout = Duration(seconds: 5);
  
  late final Dio _dio;
  final String _authToken;
  
  NetworkClient(this._authToken) {
    _dio = Dio(BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: _connectTimeout,
      receiveTimeout: _receiveTimeout,
      headers: {
        'Authorization': 'Bearer $_authToken',
        'Content-Type': 'application/json',
      },
    ));
    
    _setupInterceptors();
  }
  
  void _setupInterceptors() {
    _dio.interceptors.add(
      RetryInterceptor(
        dio: _dio,
        options: const RetryOptions(
          retries: 1,
          retryInterval: Duration(seconds: 1),
        ),
      ),
    );
    
    // TODO: add later
    // _dio.interceptors.add(LogInterceptor(
    //   request: false,
    //   requestHeader: false,
    //   requestBody: false,
    //   responseHeader: false,
    //   responseBody: false,
    //   error: false
    // ));

    _dio.interceptors.add(IsolateDeserializerInterceptor());
  }
  
  Dio get dio => _dio;
  
  Future<bool> get isConnected async {
    final connectivity = await Connectivity().checkConnectivity();
    return connectivity.first != ConnectivityResult.none;
  }
}
