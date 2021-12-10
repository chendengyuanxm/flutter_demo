import 'package:flutter_demo/model/User.dart';

userFromJson(User data, Map<String, dynamic> json) {
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

Map<String, dynamic> userToJson(User entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['accountId'] = entity.accountId;
	data['userId'] = entity.userId;
	data['personName'] = entity.personName;
	data['userState'] = entity.userState;
	return data;
}