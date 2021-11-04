import 'package:flutter_demo/model/update_version_entity.dart';
import 'package:flutter_demo/repository/user_repository.dart';
import 'package:flutter_demo/route.dart';
import 'package:flutter_demo/vm/viewmodel_helper.dart';
import 'package:lib_core/lib_core.dart';
import 'package:stacked/stacked.dart';

/// @author: Devin
/// @date: 2021/11/3 16:53
/// @description: 
class MineVM extends BaseViewModel with ViewModelHelper {

  logout() {
    execute(userRepository.logout(), onSuccess: (result) {
      locator<NavigationService>().pushNamedAndRemoveUntil(LoginPageRoute, (route) => false);
    });
  }

  getAppVersion() {
    execute<UpdateVersionEntity?>(userRepository.getAppVersion(), onSuccess: (result) {
      ToastUtil.show('获取版本成功！');
    });
  }
}