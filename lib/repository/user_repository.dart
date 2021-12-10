import 'dart:convert';
import 'dart:ffi';
import 'package:cm_core/base/repository.dart';
import 'package:cm_core/model/update_version_entity.dart';
import 'package:cm_core/model/user_info_entity.dart';
import 'package:cm_core/net/api.dart';
import 'package:dio/dio.dart';
import 'package:lib_core/lib_core.dart';
import 'package:crypto/crypto.dart';

class UserRepository extends Repository {
  /// 登录
  Future<UserInfo?> login(String userName, String password) async {
    HttpResult<UserResult> result = await http.post<UserResult>(
      Api.LOGIN,
      {
        "userId": userName,
        "password": password,
      },
      cancelToken: CancelToken(),
      loadingText: '登录中...',
    );
    return result.data?.user;
  }

  /// 登出
  Future<Void?> logout() async {
    HttpResult result = await http.post<Void>(Api.LOGOUT, {});
  }

  /// 获取更新版本
  Future<UpdateVersionEntity?> getAppVersion() async {
    HttpResult<UpdateVersionResult> result = await http.get<UpdateVersionResult>(Api.UPDATE_VERSION, {"apkTypeCode": "xm_app"});
    return result.data?.obj;
  }
}

final UserRepository userRepository = UserRepository();
