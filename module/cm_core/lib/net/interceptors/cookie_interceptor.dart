import 'dart:io';
import 'package:dio/dio.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:path_provider/path_provider.dart';

/// @author: Devin
/// @date: 2021/11/3 17:24
/// @description: 
class CookieInterceptor extends InterceptorsWrapper {
  CookieJar _cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(''));

  CookieInterceptor() {
    getApplicationDocumentsDirectory().then((directory) async {
      print('directory: $directory');
      var dir = Directory('${directory.path}/cookies');
      await dir.create();
      _cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(dir.path));
    });
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    var cookies = await _cookieJar.loadForRequest(options.uri);

    cookies.removeWhere((cookie) {
      return cookie.expires?.isBefore(DateTime.now()) ?? false;
    });

    String cookie = cookies.map((cookie) => "${cookie.name}=${cookie.value}").join('; ');
    options.headers[HttpHeaders.cookieHeader] = cookie;

    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    List<String>? cookies = response.headers[HttpHeaders.setCookieHeader] ?? response.headers[HttpHeaders.connectionHeader];
    if (cookies != null) {
      var cks = cookies.map((str) => Cookie.fromSetCookieValue(str)).toList();
      _cookieJar.saveFromResponse(response.requestOptions.uri, cks);
    }
    super.onResponse(response, handler);
  }
}