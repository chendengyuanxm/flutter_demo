import 'package:cm_inspect/cm_inspect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:flutter_demo/ui/home/home_page.dart';
import 'package:flutter_demo/ui/mine/mine_page.dart';
import 'package:flutter_demo/ui/repo/repo_page.dart';
import 'package:lib_core/lib_core.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List _items = [
    {
      'name': S.current.tab_home,
      'icon': Icons.home_rounded,
    },
    {
      'name': S.current.tab_repo,
      'icon': Icons.event_note_sharp,
    },
    {
      'name': S.current.tab_mine,
      'icon': Icons.person_outline_outlined,
    },
  ];

  List _pages = [
    InspectPage(),
    RepoPage(),
    MinePage(),
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: _doubleExit,
        child: pageView(),
      ),
      bottomNavigationBar: navigationBar(),
    );
  }

  Widget pageView() {
    return _pages[_currentIndex];
  }

  Widget navigationBar() {
    return BottomNavigationBar(
      onTap: (index) => _onBottomNavigationClick(index),
      items: _items.map((e) => BottomNavigationBarItem(
        icon: Icon(e['icon']),
        label: e['name'],
      ),).toList(),
      currentIndex: _currentIndex,
    );
  }

  _onBottomNavigationClick(int index) {
    _currentIndex = index;
    setState(() {
    });
  }

  int _lastClickTime = 0;
  Future<bool> _doubleExit() {
    int nowTime = new DateTime.now().microsecondsSinceEpoch;
    if (_lastClickTime != 0 && nowTime - _lastClickTime > 1500) {
      return new Future.value(true);
    } else {
      _lastClickTime = new DateTime.now().microsecondsSinceEpoch;
      new Future.delayed(const Duration(milliseconds: 1500), () {
        _lastClickTime = 0;
      });
      showToast('双击后退按钮退出');
      return new Future.value(false);
    }
  }
}
