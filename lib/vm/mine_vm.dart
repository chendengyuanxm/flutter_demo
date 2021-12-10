import 'package:cm_core/base/viewmodel_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/repository/user_repository.dart';
import 'package:flutter_demo/route.dart';
import 'package:lib_core/lib_core.dart';
import 'package:stacked/stacked.dart';
import 'package:cm_core/cm_core.dart';

/// @author: Devin
/// @date: 2021/11/3 16:53
/// @description: 
class MineVM extends BaseViewModel with ViewModelHelper {

  logout() async {
    // execute(userRepository.logout(), onSuccess: (result) {
    //   locator<NavigationService>().pushNamedAndRemoveUntil(LoginPageRoute, (route) => false);
    // });
    await LocalStorage.setUserId(null);
    await LocalStorage.setUserInfo(null);
    locator<NavigationService>().pushNamedAndRemoveUntil(LoginPageRoute, ModalRoute.withName(LoginPageRoute));
  }

  getAppVersion() {
    execute<UpdateVersionEntity?>(userRepository.getAppVersion(), onSuccess: (result) {
      ToastUtil.show('获取版本成功！');
    });
  }
}