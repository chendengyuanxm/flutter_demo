import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lib_widget/lib_widget.dart';

/// @author: Devin
/// @date: 2021/12/8 16:33
/// @description: 
class CustomButton extends StatelessWidget {

  final Widget child;
  final VoidCallback? onPressed;

  const CustomButton({Key? key, required this.child, required this.onPressed,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GradientWrap(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      child: ElevatedButton(
        onPressed: () {
          onPressed?.call();
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.transparent),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
        ),
        child: child,
      ),
    );
  }
}
