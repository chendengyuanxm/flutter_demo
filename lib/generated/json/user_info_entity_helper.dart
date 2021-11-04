import 'package:flutter_demo/model/user_info_entity.dart';

userResultFromJson(UserResult data, Map<String, dynamic> json) {
	if (json['user'] != null) {
		data.user = UserInfo().fromJson(json['user']);
	}
	return data;
}

Map<String, dynamic> userResultToJson(UserResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['user'] = entity.user?.toJson();
	return data;
}

userInfoFromJson(UserInfo data, Map<String, dynamic> json) {
	if (json['accountId'] != null) {
		data.accountId = json['accountId'].toString();
	}
	if (json['userId'] != null) {
		data.userId = json['userId'].toString();
	}
	if (json['personName'] != null) {
		data.personName = json['personName'].toString();
	}
	if (json['userState'] != null) {
		data.userState = json['userState'].toString();
	}
	return data;
}

Map<String, dynamic> userInfoToJson(UserInfo entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['accountId'] = entity.accountId;
	data['userId'] = entity.userId;
	data['personName'] = entity.personName;
	data['userState'] = entity.userState;
	return data;
}