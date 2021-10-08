import 'package:flutter/material.dart';
import 'package:lib_core/generated/l10n.dart';
import 'package:lib_widget/lib_widget.dart';

class RepoPage extends StatefulWidget {
  const RepoPage({Key? key}) : super(key: key);

  @override
  _RepoPageState createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: Container(),
        title: Text(S.current.tab_repo),
      ),
      body: body(),
    );
  }

  Widget body() {
    return Container();
  }
}
