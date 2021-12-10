import 'dart:io';
import 'package:lib_core/lib_core.dart';
import 'api.dart';
import 'http_const.dart';
import 'http_parser.dart';
import 'interceptors/cookie_interceptor.dart';
import 'interceptors/token_interceptor.dart';
import 'package:dio/dio.dart';

/// @author: Devin
/// @date: 2021/10/27 14:54
/// @description: 
class HttpConfig extends IHttpConfig {

  @override
  List get successCodeList => ["100"];

  @override
  BaseOptions configBaseOptions() {
    return BaseOptions(
      baseUrl: Api.BASE_URL,
      connectTimeout: HttpConst.httpTimeOut,
      receiveTimeout: HttpConst.httpTimeOut,
      sendTimeout: HttpConst.httpTimeOut,
      validateStatus: (status) => HttpConst.validStatusCode.contains(status),
      headers: {"accept": "application/json"},
    );
  }

  @override
  bool configHttps(X509Certificate cert, String host, int port) {
    return true;
  }

  @override
  List<Interceptor>? configInterceptors() {
    List<Interceptor> interceptors = [];
    interceptors.add(TokenInterceptor());
    interceptors.add(CookieInterceptor());
    return interceptors;
  }

  @override
  Future<HttpResult<T>> parseResult<T>(int statusCode, Map<String, dynamic> json, bool isList) async {
    HttpResult<T> result = HttpParser.parseJson<T>(statusCode, json, isList);
    return result;
  }
}