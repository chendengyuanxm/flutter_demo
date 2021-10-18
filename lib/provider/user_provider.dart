import 'package:flutter/cupertino.dart';
import 'package:flutter_demo/model/user_info_entity.dart';

class UserProvider extends ChangeNotifier {
  UserInfo? _userInfo;
  UserInfo? get userInfo => _userInfo;

  setChatUserInfo(UserInfo user) {
    this._userInfo = user;
    notifyListeners();
  }
}