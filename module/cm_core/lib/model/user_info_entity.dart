import 'package:cm_core/generated/json/base/json_convert_content.dart';

class UserResult with JsonConvert<UserResult> {
	UserInfo? user;
}

class UserInfo with JsonConvert<UserInfo> {
	String? accountId;
	String? userId;
	String? personName;
	String? userState;
}
