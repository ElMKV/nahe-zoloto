import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nashe_zoloto/data/api/barcode_api/barcode_api.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';


class BarcodeRepository {
  Future<BarcodeModel?> getBarcode(String code) async {
    try {
      final response = await BarcodeApi.getBarcode(code);
      return (response?.data != null)
          ? BarcodeModel.fromJson(response!.data)
          : const BarcodeModel();
    } on DioError catch (e) {
      print(e);
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      // // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
      // // snackbarKey.currentState?.showSnackBar(snackBar);
      return const BarcodeModel();
    }
  }
}


