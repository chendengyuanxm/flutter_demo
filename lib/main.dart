import 'package:cm_core/net/http_config.dart';
import 'package:flutter_demo/provider/providers.dart';
import 'package:lib_core/lib_core.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'config.dart';
import 'core_config.dart';
import 'package:flutter_baidu_mapapi_base/flutter_baidu_mapapi_base.dart';

void main() {
  runPreMain();
  runPreApp(
    MultiProvider(
      providers: providers,
      child: App(),
    ),
  );
  initSetting();
  LibCorePlugin.init(
    coreConfig: CoreConfig(),
    httpConfig: HttpConfig(),
  );
}

initSetting() async {
  BMFMapSDK.setApiKeyAndCoordType(BAIDU_KEY, BMF_COORD_TYPE.BD09LL);
}
