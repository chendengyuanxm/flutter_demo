import 'package:lib_core/service/index.dart';
import 'package:flutter_demo/ui/login_page.dart';
import 'package:stacked/stacked.dart';

class AppVM extends BaseViewModel {

  initApp() async {
    Future.delayed(Duration(seconds: 2), () => _nextPage());
  }

  _nextPage() async {
    locator<NavigationService>().pushPage(LoginPage());
  }
}