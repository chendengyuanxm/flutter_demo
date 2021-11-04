import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:flutter_demo/ui/mine/setting_page.dart';
import 'package:flutter_demo/vm/mine_vm.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_widget/lib_widget.dart';
import 'package:stacked/stacked.dart';

class MinePage extends StatefulWidget {
  const MinePage({Key? key}) : super(key: key);

  @override
  _MinePageState createState() => _MinePageState();
}

class _MinePageState extends State<MinePage> {

  late MineVM vm;

  _onClickSetting() {
    locator<NavigationService>().pushPage(SettingPage());
  }

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
      viewModelBuilder: () => vm = MineVM(),
      builder: (context, model, child) => Scaffold(
        appBar: CustomAppBar(
          title: Text(S.current.tab_mine),
          leading: Container(),
          actions: [
            IconButton(
              onPressed: _onClickSetting,
              icon: Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: body(),
        bottomNavigationBar: logoutButton(),
      ),
    );
  }

  Widget body() {
    return Container(
      child: ListView(
        children: [
          ListTile(
            onTap: () => vm.getAppVersion(),
            leading: Icon(Icons.update),
            title: Text('版本更新'),
            trailing: Icon(Icons.chevron_right),
          ),
        ],
      ),
    );
  }

  Widget logoutButton() {
    return ExpandedWrap(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: ElevatedButton(
        onPressed: () => vm.logout(),
        child: Text('Logout'),
      ),
    );
  }
}
