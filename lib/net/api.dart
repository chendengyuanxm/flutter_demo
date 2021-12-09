class Api {
  static const String BASE_URL = 'http://47.111.7.12:8050/';

  static const String DIGITAL_URL = "api-digital";

  static const String LOGIN = '/api-portal/api/v1/open/oauth/login';
  static const String LOGOUT = '/api-portal/api/logout';
  static const String UPDATE_VERSION = DIGITAL_URL + "/api/v1/app/version/getNewApkVersion";
}