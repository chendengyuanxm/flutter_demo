import 'package:flutter_demo/repository/user_repository.dart';
import 'package:flutter_demo/ui/main/main_page.dart';
import 'package:lib_core/lib_core.dart';
import 'package:flutter_demo/vm/viewmodel_helper.dart';
import 'package:stacked/stacked.dart';

class LoginVM extends BaseViewModel with ViewModelHelper {
  String? _userName;
  set userName(String text) {
    _userName = text;
    notifyListeners();
  }

  String? _password;
  set password(String text) {
    _password = text;
    notifyListeners();
  }

  bool passwordVisible = false;

  login() {
    execute(userRepository.login(_userName!, _password!), onSuccess: (result) {
      showToast('登录成功!');
      locator<NavigationService>().pushPage(MainPage());
    },
      // onError: (error) {
      //   locator<NavigationService>().pushPage(MainPage());
      // },
    );
  }

  togglePasswordVisible() {
    passwordVisible = !passwordVisible;
    notifyListeners();
  }
}