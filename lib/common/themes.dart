import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DimenConfig {
  static const double normalPagePadding = 15.0;
  static double pagePaddingH = 40.0.w;
  static double pagePaddingV = 40.0.h;
}

class TextStyleConfig {
  static final TextStyle small = TextStyle(
    fontSize: 26.sp,
  );
  static final TextStyle bold = const TextStyle(
    fontWeight: FontWeight.w800,
  );
}

class ColorConfig {
  static MaterialColor primaryColor = Colors.teal;
  static MaterialColor accentColor = Colors.deepOrange;

  static const Color normalTextColor = const Color(0xFFB1B1B1);
  static const Color background = const Color(0xFF202020);
  static const Color cyan = const Color(0xFF0ACEFF);
  static const Color grey = const Color(0xFF3C3C3C);
  static const Color yellow = const Color(0xFFFFC200);
  static const Color blue = const Color(0xFF00A0FF);
  static const Color pink = const Color(0xFFFF2CA0);
  static const List<Color> defaultGradientColors = [Color(0xFFFF5D7C), Color(0xFFFF2CA0),];
  static const List<Color> blueGradientColors = [Color(0xFF974DFF), Color(0xFF50AEFF),];
}

class ShapeConfig {
  static const ShapeBorder roundButtonBorder = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(50),),
  );
}

class EdgeConfig {
  static EdgeInsets normalPageEdge = EdgeInsets.symmetric(horizontal: DimenConfig.pagePaddingH, vertical: DimenConfig.pagePaddingV);
  static EdgeInsets normalButtonEdge = EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h);
}