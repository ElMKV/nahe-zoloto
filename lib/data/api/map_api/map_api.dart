import 'package:dio/dio.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';

class MapApi {
  static Future<Response?> getAddress() async {
    var dio = Dio();
    Response? bar;
    try {
      bar = await dio.get('${AppConstants.base}/api/mobile/geo');
      print('STATUS ${bar.statusMessage}');
      print('DATA ${bar.data}');
      return bar;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
