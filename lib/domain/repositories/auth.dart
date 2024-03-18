import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:nashe_zoloto/core/utils.dart';
import 'package:nashe_zoloto/data/api/auth_api/auth_api.dart';

import 'package:nashe_zoloto/data/model/auth/auth.dart';
import 'package:nashe_zoloto/data/model/profile/profile.dart';
import 'package:nashe_zoloto/data/network/dio_exception.dart';

class AuthRepository {
  Future<Auth?> getAuth(String login, password) async {
    try {
      final response = await AuthApi.getAuth(login, password);
      return (response?.data != null)
          ? Auth.fromJson(response!.data)
          : const Auth();
    } on DioError catch (e) {
      print(e);
      // final errorMessage = DioExceptions.fromDioError(e).toString();
      // // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
      // // snackbarKey.currentState?.showSnackBar(snackBar);
      return const Auth();
    }
  }

  Future<Profile?> getProfile() async {
    String? token = await GetLoginData();

    if(token != null){
      try {
        final response = await AuthApi.getProfile(token);
        return (response?.data != null)
            ? Profile.fromJson(response!.data)
            : const Profile();
      } on DioError catch (e) {
        print(e);
        // final errorMessage = DioExceptions.fromDioError(e).toString();
        // // final SnackBar snackBar = SnackBar(content: Text(errorMessage));
        // // snackbarKey.currentState?.showSnackBar(snackBar);
        return const Profile();
      }
    }

  }
}


