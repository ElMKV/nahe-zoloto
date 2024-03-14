import 'package:dio/dio.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';

class AuthApi {
  static Future<Response?> getAuth(String login, String password) async {
    var dio = Dio();
    Response? auth;
    try {
      auth = await dio.post('${AppConstants.base}/api/mobile/login',
          data: {"login": login, "password": password});
      print('STATUS ${auth.statusMessage}');
      print('DATA ${auth.data}');
      return auth;
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  static Future<Response?> getProfile() async {
    var dio = Dio();
    Response? auth;
    try {
      auth = await dio.get('${AppConstants.base}/api/mobile/user',
          options: Options(headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer 75ab8da27101c419cee789bf19e5660aaf684143601356ac4a6bc796656c986a',
          }));
      print('STATUS ${auth.statusMessage}');
      print('DATA ${auth.data}');
      return auth;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
