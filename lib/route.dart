import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/login_page.dart';
import 'package:flutter_demo/ui/main/main_page.dart';

const String HomePageRoute = 'HomePageRoute';
const String LoginPageRoute = 'LoginPageRoute';

Route<dynamic> generateRoute(RouteSettings settings) {
  String? routeName = settings.name;

  switch (routeName) {
    case LoginPageRoute:
      return MaterialPageRoute(builder: (_) => LoginPage());
    case HomePageRoute:
      return MaterialPageRoute(builder: (_) => MainPage());
    default:
      return MaterialPageRoute(builder: (BuildContext context) {
        return Scaffold(
            body: Center(
          child: Text('找不到路由页面'),
        ));
      });
  }
}
