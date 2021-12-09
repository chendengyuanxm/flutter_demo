import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_demo/vm/login_vm.dart';
import 'package:flutter_demo/widget/custom_button.dart';
import 'package:lib_widget/lib_widget.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter_demo/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late LoginVM vm;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => vm = LoginVM()..init(),
        builder: (context, model, child) => Scaffold(
          body: Container(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(R.iconLoginTopBg,),
                Align(
                  alignment: Alignment(0.0, -0.7),
                  child: logoView(),
                ),
                Align(
                  alignment: Alignment(0.0, 0.2),
                  child: centerView(),
                ),
                Align(
                  alignment: Alignment(0.0, 0.9),
                  child: bottomView(),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget logoView() {
    return Text('城市综合管理服务平台', style: TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.w600,
      fontSize: 28,
    ),);
  }

  Widget centerView() {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 20, 20, 70),
      margin: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.3), blurRadius: 2.0, spreadRadius: 1.0),]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('  登录', style: TextStyle(
            fontSize: 58.sp,
            fontWeight: FontWeight.bold,
          ),),
          SizedBox(height: 10,),
          inputView(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Checkbox(
                onChanged: (value) => vm.toggleRememberPassword(value!),
                value: vm.rememberPassword,
              ),
              Text('记住密码'),
            ],
          ),
          SizedBox(height: 40,),
          loginButton(),
        ],
      ),
    );
  }

  Widget inputView() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: vm.userNameTextEditingController..text,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: '请输入用户名',
                  suffixIcon: Visibility(
                    visible: vm.userNameTextEditingController.text.length > 0,
                    child: IconButton(
                      onPressed: () => vm.userNameTextEditingController.clear(),
                      icon: Icon(Icons.clear),
                    ),
                  ),
                ),
                onChanged: (text) => vm.userName = text,
              ),
            ),
          ],
        ),
        Divider(),
        SizedBox(height: 10,),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: vm.passwordTextEditingController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: !vm.passwordVisible,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  hintText: '请输入密码',
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
      child: CustomButton(
        onPressed: () => vm.login(),
        child: Text('登录'),
      ),
    );
  }

  Widget bottomView() {
    return Text('智慧城市监督管理指挥中心', style: TextStyle(
      fontSize: 34.sp,
    ),);
  }
}
