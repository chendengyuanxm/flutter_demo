import 'package:flutter_demo/generated/json/base/json_convert_content.dart';
import 'package:flutter_demo/net/http_const.dart';
import 'package:lib_core/lib_core.dart';

/// @author: Devin
/// @date: 2021/10/27 14:59
/// @description: 
class HttpParser {

  static HttpResult<T> parseJson<T>(int statusCode, Map<String, dynamic> json, bool isList) {
    HttpResult<T> result = HttpResult();
    result.isList = isList;

    try {
      result.httpCode = statusCode;
      result.code = json['code'] ?? HttpCode.defaultCode;
      result.message = json['message'] ?? json['msg'];

      if (json['code'] == HttpConst.httpResultSuccess) {
        dynamic data = json['body'];
        if (T == dynamic) {
          return data;
        } else {
          result.data = JsonConvert.fromJsonAsT<T>(data);
        }
      }
    } catch (exception) {
      LogUtil.e(exception);
      result.code = HttpCode.jsonParseException;
      result.message = 'JSON解析错误[${exception.toString()}]';
    }

    return result;
  }
}