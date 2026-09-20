import 'package:dio/dio.dart';
import 'package:ecommerce/core/shared_pref_utils/shared_pref_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import 'di.dart';

@module
abstract class NetworkModule {
  // Add any common network-related methods or properties here
  Dio get dio {
    var dio = Dio(
      BaseOptions(baseUrl: 'https://ecommerce.routemisr.com/api/v1/'),
    );
    if (kDebugMode) {
      dio.interceptors.add(LanguageInterceptor());
      dio.interceptors.add(AuthInterceptor());
      dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
        ),
      );
    }
    return dio;
  }
}

class LanguageInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll({"language": "en"});
    super.onRequest(options, handler);
  }
}

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    var prefs = getIt<SharedPrefUtils>();
    options.headers.addAll({"token": await prefs.getToken()});

    super.onRequest(options, handler);
  }
}
