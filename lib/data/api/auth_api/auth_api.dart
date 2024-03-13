
import 'package:dio/dio.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';

class AuthApi {
  static Future<Response?> getAuth(String login, String password) async {
    var dio = Dio();
    Response? news;
    try {
      news = await dio.post('${AppConstants.base}/api/mobile/login', data: {
        "login" : login,
        "password": password
      });
      print('STATUS ${news.statusMessage}');
      print('DATA ${news.data}');
      return news;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
