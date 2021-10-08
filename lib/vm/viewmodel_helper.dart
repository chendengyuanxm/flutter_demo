import 'package:fluttertoast/fluttertoast.dart';
import 'package:lib_core/net/http_request_exception.dart';
import 'package:lib_core/util/index.dart';

typedef OnSuccess<T>(T data);
typedef OnError(dynamic e);

class ViewModelHelper {

  execute<T>(Future request, {OnSuccess<T>? onSuccess, OnError? onError}) async {
    try {
      T result = await request;
      if (onSuccess != null) onSuccess(result);
      return result;
    } on HttpRequestException catch (e) {
      if (onError != null) onError(e);
      else handleException(e);
    } on Error catch (e) {
      if (onError != null) onError(e);
      else handleError(e);
    }

    return null;
  }

  executeQueue(List<Future> requests, {Function? onSuccess, OnError? onError}) async {
    try {
      List results = [];
      int i = 0;
      Future.forEach(requests, (request) async {
       results[i++] = await request;
      });
      if (onSuccess != null) onSuccess(results);
      return results;
    } on HttpRequestException catch (e) {
      handleException(e);
      if (onError != null) onError(e);
    } on Error catch (e) {
      handleError(e);
      if (onError != null) onError(e);
    }
  }

  handleException(HttpRequestException e) {
    LogUtil.e(e.toString());
    Fluttertoast.showToast(msg: e.errMsg);
  }

  handleError(Error e) {
    LogUtil.e(e.toString());
    print(e.stackTrace);
    Fluttertoast.showToast(msg: e.toString());
  }
}