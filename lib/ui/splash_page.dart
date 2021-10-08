import 'package:flutter/material.dart';
import 'package:flutter_demo/vm/app_vm.dart';
import 'package:stacked/stacked.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  late AppVM vm;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewModelBuilder.nonReactive(
        viewModelBuilder: () => vm = AppVM()..initApp(),
        fireOnModelReadyOnce: true,
        builder: (context, model, child) {
          return Container(
            color: Theme.of(context).primaryColor,
            alignment: Alignment.center,
            child: Text('Welcome magic world', style: TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.w600,
              fontStyle: FontStyle.italic,
              fontFamily: 'vladimir',
            ),),
          );
        }
      ),
    );
  }
}
