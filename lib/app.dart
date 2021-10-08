import 'package:flutter/material.dart';
import 'package:lib_core/provider/localization_provider.dart';
import 'package:lib_core/provider/theme_provider.dart';
import 'package:lib_core/service/index.dart';
import 'package:flutter_demo/ui/main/main_page.dart';
import 'package:flutter_demo/ui/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:lib_core/generated/l10n.dart';
import 'route.dart';

class App extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(1080, 2160),
      builder: () => MaterialApp(
        title: 'Flutter Framework',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Provider.of<ThemeProvider>(context).primaryColor,
          accentColor: Provider.of<ThemeProvider>(context).accentColor,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        home: SplashPage(),
        navigatorKey: navigationKey,
        onGenerateRoute: generateRoute,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          // RefreshLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        locale: Provider.of<LocalizationProvider>(context).locale,
      ),
    );
  }
}