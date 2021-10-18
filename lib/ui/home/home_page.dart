import 'package:flutter/material.dart';
import 'package:flutter_demo/generated/l10n.dart';
import 'package:lib_widget/lib_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Container(),
        title: Text(S.current.tab_home),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}
