import 'package:flutter_demo/provider/providers.dart';
import 'package:lib_core/pre_main.dart';
import 'package:provider/provider.dart';
import 'app.dart';

void main() {
  runPreMain();
  runPreApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
}
