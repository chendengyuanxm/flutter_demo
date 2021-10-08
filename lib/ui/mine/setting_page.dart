import 'package:flutter/material.dart';
import 'package:flutter_demo/ui/mine/language_setting_page.dart';
import 'package:flutter_demo/ui/mine/theme_setting_page.dart';
import 'package:lib_core/service/index.dart';
import 'package:lib_widget/lib_widget.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool _isChines = true;

  _onClickToggleLocalization() {
    locator<NavigationService>().pushPage(LanguageSettingPage());
  }

  _onClickToggleTheme() {
    locator<NavigationService>().pushPage(ThemeSettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('Setting'),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container(
      child: Column(
        children: [
          ListTile(
            onTap: () => _onClickToggleLocalization(),
            leading: Icon(Icons.language),
            title: Text('切换语言'),
            trailing: Icon(Icons.chevron_right),
          ),
          ListTile(
            onTap: () => _onClickToggleTheme(),
            leading: Icon(Icons.language),
            title: Text('切换主题'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }
}
