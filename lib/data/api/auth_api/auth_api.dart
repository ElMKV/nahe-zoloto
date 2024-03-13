
import 'package:dio/dio.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';

class AuthApi {
  static Future<Response?> getAuth(String login, String password) async {
    var dio = Dio();
    Response? auth;
    try {
      auth = await dio.post('${AppConstants.base}/api/mobile/login', data: {
        "login" : login,
        "password": password
      });
      print('STATUS ${auth.statusMessage}');
      print('DATA ${auth.data}');
      return auth;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
