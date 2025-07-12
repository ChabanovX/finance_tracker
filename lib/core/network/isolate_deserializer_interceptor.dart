import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:worker_manager/worker_manager.dart';

class IsolateDeserializerInterceptor extends Interceptor {
  IsolateDeserializerInterceptor() {
    workerManager.init();
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    try {
      final headers = response.headers[Headers.contentTypeHeader];
      final isJson = headers?.any((h) => h.contains('application/json')) ?? false;

      if (isJson) {
        if (response.data is String) {
          response.data = await workerManager.execute<dynamic>(
            () => jsonDecode(response.data as String),
          );
        } else if (response.data is List<int>) {
          final string = utf8.decode(response.data as List<int>);
          response.data = await workerManager.execute<dynamic>(
            () => jsonDecode(string),
          );
        }
      }
    } catch (e, st) {
      return handler.reject(
        DioException(
          requestOptions: response.requestOptions,
          error: e,
          stackTrace: st,
          response: response,
          type: DioExceptionType.unknown,
        ),
      );
    }
    handler.next(response);
  }
}
