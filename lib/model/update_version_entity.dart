import 'package:flutter_demo/generated/json/base/json_convert_content.dart';

class UpdateVersionResult with JsonConvert<UpdateVersionResult> {
	UpdateVersionEntity? obj;
}

class UpdateVersionEntity with JsonConvert<UpdateVersionEntity> {
	String? createTime;
	dynamic? updateTime;
	int? id;
	String? apkName;
	String? versionCode;
	String? versionName;
	String? md5;
	String? apkSize;
	String? updateContent;
	String? validFlag;
	String? isCompel;
	String? apkTypeCode;
	dynamic? orderBy;
	dynamic? orderByName;
	UpdateVersionAffixes? affixes;
}

class UpdateVersionAffixes with JsonConvert<UpdateVersionAffixes> {
	String? createTime;
	dynamic? updateTime;
	int? id;
	dynamic? fileCode;
	String? fileName;
	String? fileType;
	String? objectType;
	int? objectId;
	String? filePath;
	String? fileSize;
	dynamic? labelCode;
	dynamic? labelName;
	String? createUser;
}
