import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/login_page.dart';
import 'package:flutter_demo/ui/main/main_page.dart';
import 'package:flutter_demo/ui/splash_page.dart';

const String SplashPageRoute = 'SplashPageRoute';
const String HomePageRoute = 'HomePageRoute';
const String LoginPageRoute = 'LoginPageRoute';

Route<dynamic> generateRoute(RouteSettings settings) {
  String? routeName = settings.name;

  switch (routeName) {
    case SplashPageRoute:
      return MaterialPageRoute(builder: (_) => SplashPage(), settings: settings);
    case LoginPageRoute:
      return MaterialPageRoute(builder: (_) => LoginPage(), settings: settings);
    case HomePageRoute:
      return MaterialPageRoute(builder: (_) => MainPage(), settings: settings);
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
            body: Center(
          child: Text('找不到路由页面'),
        ));
      }, settings: settings);
  }
}
