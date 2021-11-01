/// @author: Devin
/// @date: 2021/10/27 15:33
/// @description: 
class HttpConst {
  ///http超时
  static const httpTimeOut = 10 * 1000;

  ///成功请求http状态码
  static const validStatusCode = [200, 201, 204];

  ///接口请求网络成功code
  static const httpResultSuccess = 100;

  ///token错误code
  static const sysTokenError = 900001;

  ///token过期code
  static const sysTokenExpired = 900002;
}