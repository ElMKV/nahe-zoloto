import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:nashe_zoloto/data/api/barcode_api/barcode_api.dart';
import 'package:nashe_zoloto/data/api/map_api/map_api.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';
import 'package:nashe_zoloto/data/model/mapModel/mapModel.dart';


class MapRepository {
  Future<List<MapModel>?> getAddress() async {
    try {
      final response = await MapApi.getAddress();
      return (response?.data != null)
          ? (response!.data as List).map((e) => MapModel.fromJson(e)).toList()
          : [];
    } on DioError catch (e) {
      print(e);
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      // // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
      // // snackbarKey.currentState?.showSnackBar(snackBar);
      return const [];
    }
  }
}


