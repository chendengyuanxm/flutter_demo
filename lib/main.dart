import 'package:flutter_demo/provider/providers.dart';
import 'package:lib_core/lib_core.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'package:flutter_demo/net/http_config.dart';
import 'core_config.dart';

void main() {
  runPreMain();
  runPreApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
  LibCorePlugin.init(
    coreConfig: CoreConfig(),
    httpConfig: HttpConfig(),
  );
}
