import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/net/api.dart';
import 'package:lib_core/net/abstract_http_client.dart';
import 'package:dio/dio.dart';
import 'package:lib_core/net/lib_core_net.dart';

class DefaultHttpClient extends HttpClient {

  factory DefaultHttpClient([HttpOptions? options]) => DefaultHttpClient._internal(options);

  DefaultHttpClient._internal([HttpOptions? options]) : super(options);

  @override
  T parseResult<T>(Response resp) {
    int status = int.parse(resp.data['code']);
    String message = resp.data['message'] ?? resp.data['msg'];
    dynamic result = resp.data['body'];
    if (status == 100) {
      if (T == dynamic) {
        return result;
      } else {
        T bean = JsonConvert.fromJsonAsT<T>(result);
        return bean;
      }
    }

    throw HttpRequestException(status, status.toString(), message);
  }

}

final HttpClient http = DefaultHttpClient(HttpOptions(baseUrl: Api.BASE_URL));