/// 打包环境
const String APP_CHANNEL = String.fromEnvironment('APP_CHANNEL');
/// 打包版本号
const int VERSION_CODE = int.fromEnvironment('VERSION_CODE');
/// 是否生产
const bool IS_RELEASE = APP_CHANNEL == 'prod' ? true : false;
/// 上传位置间隔时间
const int UPLOAD_LOCATION_DURATION = 90*1000;
/// 巡查记录间隔
const int INSPECT_DURATION = 3000;
/// 极光推送KEY
const String PUSH_KEY = '3456e4566cfa7c1f65d04b7b';
/// 百度KEY
const String BAIDU_KEY = '7dtFmooycp4So926af1GKG3mqEHOQWZx';
/// BUGLY安卓KEY
const String BUGLY_ANDROID_APP_ID = '5491d60ca4';
/// BUGLY IOS KEY
const String BUGLY_IOS_APP_ID = '2999f4ef92';