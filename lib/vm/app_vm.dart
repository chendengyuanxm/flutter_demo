import 'package:flutter_demo/route.dart';
import 'package:flutter_demo/ui/login_page.dart';
import 'package:flutter_demo/ui/main/main_page.dart';
import 'package:lib_core/lib_core.dart';
import 'package:stacked/stacked.dart';
import 'package:cm_core/cm_core.dart';

class AppVM extends BaseViewModel {

  initApp() async {
    Future.delayed(Duration(seconds: 2), () => _nextPage());
  }

  _nextPage() async {
    UserInfo? user = await LocalStorage.getUserInfo();
    if (user == null) {
      await locator<NavigationService>().pushNamed(LoginPageRoute);
    } else {
      await locator<NavigationService>().pushNamed(HomePageRoute);
    }
  }
}