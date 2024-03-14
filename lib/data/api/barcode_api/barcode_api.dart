import 'package:dio/dio.dart';
import 'package:nashe_zoloto/core/constants/constant.dart';

class BarcodeApi {
  static Future<Response?> getBarcode(String code) async {
    var dio = Dio();
    Response? bar;
    try {
      bar = await dio.get('${AppConstants.base}/api/mobile/good/$code');
      print('STATUS ${bar.statusMessage}');
      print('DATA ${bar.data}');
      return bar;
    } catch (e) {
      print(e);
      rethrow;
    }
  }
}
