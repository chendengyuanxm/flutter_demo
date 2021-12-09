import 'package:flutter/material.dart';
import 'package:flutter_demo/model/user_info_entity.dart';
import 'package:flutter_demo/repository/user_repository.dart';
import 'package:flutter_demo/route.dart';
import 'package:flutter_demo/ui/main/main_page.dart';
import 'package:lib_core/lib_core.dart';
import 'package:flutter_demo/vm/viewmodel_helper.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/common/index.dart';

class LoginVM extends BaseViewModel with ViewModelHelper {
  TextEditingController userNameTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  String? _userName;
  String? get userName => _userName;
  set userName(String? text) {
    _userName = text;
    notifyListeners();
  }

  String? _password;
  String? get password => _password;
  set password(String? text) {
    _password = text;
    notifyListeners();
  }

  bool passwordVisible = false;
  bool rememberPassword = false;

  init() async {
    _userName = await SharedPreference.get(Const.savedUserName);
    rememberPassword = await SharedPreference.getBool(Const.rememberPassword);
    if (rememberPassword) {
      _password = await SharedPreference.get(Const.savedPassword);
    }
    userNameTextEditingController.text = _userName??'';
    passwordTextEditingController.text = _password??'';
    notifyListeners();
  }

  login() {
    execute<UserInfo>(userRepository.login(_userName!, _password!), onSuccess: (result) {
        showToast('登录成功!');
        onUserLoginSuccessful(result);
      },
    );
  }

  onUserLoginSuccessful(UserInfo? user) async {
    await SharedPreference.set(Const.savedUserName, _userName!);
    await LocalStorage.setUserId(user?.accountId);
    await LocalStorage.setUserInfo(user);
    if (rememberPassword) {
      await SharedPreference.set(Const.savedPassword, _password!);
    }
    await locator<NavigationService>().pushNamed(HomePageRoute);
  }

  togglePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }

  toggleRememberPassword(bool value) {
    rememberPassword = value;
    SharedPreference.setBool(Const.rememberPassword, rememberPassword);
    notifyListeners();
  }
}