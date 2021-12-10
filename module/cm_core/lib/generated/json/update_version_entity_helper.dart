import 'package:cm_core/model/update_version_entity.dart';

updateVersionResultFromJson(UpdateVersionResult data, Map<String, dynamic> json) {
	if (json['obj'] != null) {
		data.obj = UpdateVersionEntity().fromJson(json['obj']);
	}
	return data;
}

Map<String, dynamic> updateVersionResultToJson(UpdateVersionResult entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['obj'] = entity.obj?.toJson();
	return data;
}

updateVersionEntityFromJson(UpdateVersionEntity data, Map<String, dynamic> json) {
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'];
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['apkName'] != null) {
		data.apkName = json['apkName'].toString();
	}
	if (json['versionCode'] != null) {
		data.versionCode = json['versionCode'].toString();
	}
	if (json['versionName'] != null) {
		data.versionName = json['versionName'].toString();
	}
	if (json['md5'] != null) {
		data.md5 = json['md5'].toString();
	}
	if (json['apkSize'] != null) {
		data.apkSize = json['apkSize'].toString();
	}
	if (json['updateContent'] != null) {
		data.updateContent = json['updateContent'].toString();
	}
	if (json['validFlag'] != null) {
		data.validFlag = json['validFlag'].toString();
	}
	if (json['isCompel'] != null) {
		data.isCompel = json['isCompel'].toString();
	}
	if (json['apkTypeCode'] != null) {
		data.apkTypeCode = json['apkTypeCode'].toString();
	}
	if (json['orderBy'] != null) {
		data.orderBy = json['orderBy'];
	}
	if (json['orderByName'] != null) {
		data.orderByName = json['orderByName'];
	}
	if (json['affixes'] != null) {
		data.affixes = UpdateVersionAffixes().fromJson(json['affixes']);
	}
	return data;
}

Map<String, dynamic> updateVersionEntityToJson(UpdateVersionEntity entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['id'] = entity.id;
	data['apkName'] = entity.apkName;
	data['versionCode'] = entity.versionCode;
	data['versionName'] = entity.versionName;
	data['md5'] = entity.md5;
	data['apkSize'] = entity.apkSize;
	data['updateContent'] = entity.updateContent;
	data['validFlag'] = entity.validFlag;
	data['isCompel'] = entity.isCompel;
	data['apkTypeCode'] = entity.apkTypeCode;
	data['orderBy'] = entity.orderBy;
	data['orderByName'] = entity.orderByName;
	data['affixes'] = entity.affixes?.toJson();
	return data;
}

updateVersionAffixesFromJson(UpdateVersionAffixes data, Map<String, dynamic> json) {
	if (json['createTime'] != null) {
		data.createTime = json['createTime'].toString();
	}
	if (json['updateTime'] != null) {
		data.updateTime = json['updateTime'];
	}
	if (json['id'] != null) {
		data.id = json['id'] is String
				? int.tryParse(json['id'])
				: json['id'].toInt();
	}
	if (json['fileCode'] != null) {
		data.fileCode = json['fileCode'];
	}
	if (json['fileName'] != null) {
		data.fileName = json['fileName'].toString();
	}
	if (json['fileType'] != null) {
		data.fileType = json['fileType'].toString();
	}
	if (json['objectType'] != null) {
		data.objectType = json['objectType'].toString();
	}
	if (json['objectId'] != null) {
		data.objectId = json['objectId'] is String
				? int.tryParse(json['objectId'])
				: json['objectId'].toInt();
	}
	if (json['filePath'] != null) {
		data.filePath = json['filePath'].toString();
	}
	if (json['fileSize'] != null) {
		data.fileSize = json['fileSize'].toString();
	}
	if (json['labelCode'] != null) {
		data.labelCode = json['labelCode'];
	}
	if (json['labelName'] != null) {
		data.labelName = json['labelName'];
	}
	if (json['createUser'] != null) {
		data.createUser = json['createUser'].toString();
	}
	return data;
}

Map<String, dynamic> updateVersionAffixesToJson(UpdateVersionAffixes entity) {
	final Map<String, dynamic> data = new Map<String, dynamic>();
	data['createTime'] = entity.createTime;
	data['updateTime'] = entity.updateTime;
	data['id'] = entity.id;
	data['fileCode'] = entity.fileCode;
	data['fileName'] = entity.fileName;
	data['fileType'] = entity.fileType;
	data['objectType'] = entity.objectType;
	data['objectId'] = entity.objectId;
	data['filePath'] = entity.filePath;
	data['fileSize'] = entity.fileSize;
	data['labelCode'] = entity.labelCode;
	data['labelName'] = entity.labelName;
	data['createUser'] = entity.createUser;
	return data;
}