import 'package:flutter/material.dart';
import 'package:flutter_demo/common/index.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:flutter_demo/provider/localization_provider.dart';
import 'package:flutter_demo/provider/theme_provider.dart';
import 'package:flutter_demo/ui/splash_page.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lib_core/lib_core.dart';
import 'package:provider/provider.dart';
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
          backgroundColor: ColorConfig.background,
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
          ),
        ),
        initialRoute: SplashPageRoute,
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