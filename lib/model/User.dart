import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

/// @author: Devin
/// @date: 2021/12/10 9:23
/// @description: 
class User with JsonConvert<User> {
  String? accountId;
  String? userId;
  String? personName;
  String? userState;
}