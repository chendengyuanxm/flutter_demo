import 'package:flutter/material.dart';
import 'package:flutter_demo/vm/login_vm.dart';
import 'package:lib_widget/lib_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/assets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _userNameTextEditingController = TextEditingController();
  TextEditingController _passwordTextEditingController = TextEditingController();

  late LoginVM vm;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => vm = LoginVM(),
        builder: (context, model, child) => Scaffold(
          body: Container(
            padding: EdgeInsets.all(40),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                logoView(),
                SizedBox(height: 30,),
                inputView(),
                SizedBox(height: 40,),
                loginButton(),
              ],
            ),
          ),
        ),
    );
  }

  Widget logoView() {
    return Text('Flutter Framework', style: TextStyle(
      color: Theme.of(context).primaryColor,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),);
  }

  Widget inputView() {
    return Column(
      children: [
        Row(
          children: [
            Icon(Icons.person_outline),
            Expanded(
              child: TextField(
                controller: _userNameTextEditingController,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: 'input your account',
                ),
                onChanged: (text) => vm.userName = text,
              ),
            ),
          ],
        ),
        Divider(),
        Row(
          children: [
            Icon(Icons.lock_outline_rounded),
            Expanded(
              child: TextField(
                controller: _passwordTextEditingController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: 'input your password',
                ),
                onChanged: (text) => vm.password = text,
              ),
            ),
            GestureDetector(
              onTap: () => vm.togglePasswordVisible(),
              child: Image.asset(vm.passwordVisible ? R.iconHide : R.iconOpen, height: 20,),
            ),
          ],
        ),
        Divider(),
      ],
    );
  }

  Widget loginButton() {
    return ExpandedWrap(
      child: ElevatedButton(
        onPressed: () => vm.login(),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
        ),
        child: Text('Login'),
      ),
    );
  }
}
