import 'package:flutter/material.dart';
import 'package:lib_core/lib_core.dart';
import 'package:lib_widget/lib_widget.dart';
import 'package:provider/provider.dart';

class ThemeSettingPage extends StatefulWidget {
  const ThemeSettingPage({Key? key}) : super(key: key);

  @override
  _ThemeSettingPageState createState() => _ThemeSettingPageState();
}

class _ThemeSettingPageState extends State<ThemeSettingPage> {
  List<MaterialColor> _colors = [
    Colors.blue,
    Colors.pink,
    Colors.purple,
    Colors.cyan,
    Colors.orange,
    Colors.teal,
  ];

  _toggleTheme(color) {
    Provider.of<ThemeProvider>(context, listen: false,).primaryColor = color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: Text('主题切换'),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Wrap(
          spacing: 20,
          children: _colors.map((e) => GestureDetector(
            onTap: () => _toggleTheme(e),
            child: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: e,
                border: Border.all(width: 3, color: Colors.black38),
              ),
            ),
          ),).toList(),
        ),
      ),
    );
  }
}
