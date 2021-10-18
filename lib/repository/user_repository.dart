import 'dart:ffi';
import 'package:dio/dio.dart';
import 'package:flutter_demo/model/user_info_entity.dart';
import 'package:flutter_demo/net/api.dart';
import 'package:flutter_demo/net/default_http_client.dart';

class UserRepository {
  /// 登录
  Future<UserInfo?> login(String userName, String password) async {
    return await http.post<UserInfo>(Api.LOGIN, {
      "userId": userName,
      "password": password,
    }, cancelToken: CancelToken(),);
  }

  /// 登出
  Future<Void?> logout() async {
    return await http.post<Void>(Api.LOGOUT, {});
  }
}

final UserRepository userRepository = UserRepository();
