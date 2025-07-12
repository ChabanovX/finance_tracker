import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  final RetryOptions options;
  
  RetryInterceptor({required this.dio, required this.options});
  
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (_shouldRetry(err) && err.requestOptions.extra['retryCount'] == null) {
      err.requestOptions.extra['retryCount'] = 0;
    }
    
    final retryCount = err.requestOptions.extra['retryCount'] ?? 0;
    
    if (_shouldRetry(err) && retryCount < options.retries) {
      err.requestOptions.extra['retryCount'] = retryCount + 1;
      
      // Exponential backoff.
      final delay = Duration(
        milliseconds: options.retryInterval.inMilliseconds * 
                     (1 << retryCount), // 2^retryCount.
      );
      
      await Future.delayed(delay);
      
      try {
        final response = await dio.fetch(err.requestOptions);
        handler.resolve(response);
      } catch (e) {
        super.onError(err, handler);
      }
    } else {
      super.onError(err, handler);
    }
  }
  
  /// Retry err codes.
  bool _shouldRetry(DioException err) {
    final retryStatusCodes = [500, 502, 503, 504, 408, 429];
    return err.response?.statusCode != null &&
           retryStatusCodes.contains(err.response!.statusCode);
  }
}

class RetryOptions {
  final int retries;
  final Duration retryInterval;
  
  const RetryOptions({
    required this.retries,
    required this.retryInterval,
  });
}
