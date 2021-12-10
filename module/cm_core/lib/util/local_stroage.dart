import 'dart:convert';
import 'package:lib_core/lib_core.dart';
import 'package:cm_core/generated/json/base/json_convert_content.dart';
import '../model/user_info_entity.dart';
import '../model/user_info_entity.dart';

const TOKEN = "token";
const USER_ID = "userId";
const USER_INFO = "userInfo";

class LocalStorage {
  static Future<String?> getToken() async {
    return await SharedPreference.get(TOKEN);
  }

  static Future<bool> setToken(String token) async {
    return await SharedPreference.set(TOKEN, token);
  }

  static Future<String?> getUserId() async {
    return await SharedPreference.get(USER_ID);
  }

  static Future<bool> setUserId(String? userId) async {
    return await SharedPreference.set(USER_ID, userId??'');
  }

  static Future<bool> setUserInfo<T>(T? userInfo) async {
    return await SharedPreference.set(USER_INFO, userInfo == null ? '' : jsonEncode(userInfo));
  }

  static Future<UserInfo?> getUserInfo() async {
    String? json = await SharedPreference.get(USER_INFO);
    return json == null || json.isEmpty ? null : JsonConvert.fromJsonAsT<UserInfo>(jsonDecode(json));
  }
}
