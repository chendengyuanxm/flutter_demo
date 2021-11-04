// ignore_for_file: non_constant_identifier_names
// ignore_for_file: camel_case_types
// ignore_for_file: prefer_single_quotes

// This file is automatically generated. DO NOT EDIT, all your changes would be lost.
import 'package:flutter_demo/model/user_info_entity.dart';
import 'package:flutter_demo/generated/json/user_info_entity_helper.dart';
import 'package:flutter_demo/model/update_version_entity.dart';
import 'package:flutter_demo/generated/json/update_version_entity_helper.dart';

class JsonConvert<T> {
	T fromJson(Map<String, dynamic> json) {
		return _getFromJson<T>(runtimeType, this, json);
	}

  Map<String, dynamic> toJson() {
		return _getToJson<T>(runtimeType, this);
  }

  static _getFromJson<T>(Type type, data, json) {
		switch (type) {
			case UserResult:
				return userResultFromJson(data as UserResult, json) as T;
			case UserInfo:
				return userInfoFromJson(data as UserInfo, json) as T;
			case UpdateVersionEntity:
				return updateVersionEntityFromJson(data as UpdateVersionEntity, json) as T;
			case UpdateVersionAffixes:
				return updateVersionAffixesFromJson(data as UpdateVersionAffixes, json) as T;    }
		return data as T;
	}

  static _getToJson<T>(Type type, data) {
		switch (type) {
			case UserResult:
				return userResultToJson(data as UserResult);
			case UserInfo:
				return userInfoToJson(data as UserInfo);
			case UpdateVersionEntity:
				return updateVersionEntityToJson(data as UpdateVersionEntity);
			case UpdateVersionAffixes:
				return updateVersionAffixesToJson(data as UpdateVersionAffixes);
			}
			return data as T;
		}
  //Go back to a single instance by type
	static _fromJsonSingle<M>( json) {
		String type = M.toString();
		if(type == (UserResult).toString()){
			return UserResult().fromJson(json);
		}
		if(type == (UserInfo).toString()){
			return UserInfo().fromJson(json);
		}
		if(type == (UpdateVersionEntity).toString()){
			return UpdateVersionEntity().fromJson(json);
		}
		if(type == (UpdateVersionAffixes).toString()){
			return UpdateVersionAffixes().fromJson(json);
		}

		return null;
	}

  //list is returned by type
	static M _getListChildType<M>(List data) {
		if(<UserResult>[] is M){
			return data.map<UserResult>((e) => UserResult().fromJson(e)).toList() as M;
		}
		if(<UserInfo>[] is M){
			return data.map<UserInfo>((e) => UserInfo().fromJson(e)).toList() as M;
		}
		if(<UpdateVersionEntity>[] is M){
			return data.map<UpdateVersionEntity>((e) => UpdateVersionEntity().fromJson(e)).toList() as M;
		}
		if(<UpdateVersionAffixes>[] is M){
			return data.map<UpdateVersionAffixes>((e) => UpdateVersionAffixes().fromJson(e)).toList() as M;
		}

		throw Exception("not found");
	}

  static M fromJsonAsT<M>(json) {
		if (json is List) {
			return _getListChildType<M>(json);
		} else {
			return _fromJsonSingle<M>(json) as M;
		}
	}
}