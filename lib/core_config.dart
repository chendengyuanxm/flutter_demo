import 'dart:ui';

import 'package:flutter_demo/generated/l10n.dart';
import 'package:lib_core/lib_core.dart';

/// @author: Devin
/// @date: 2021/11/3 11:00
/// @description: 
class CoreConfig extends ICoreConfig {
  @override
  List<Locale> get supportedLocales => S.delegate.supportedLocales;
}