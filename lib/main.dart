import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/data/model/barcode/barcode.dart';
import 'package:nashe_zoloto/injection_container.dart';
import 'package:nashe_zoloto/pages/home/detail/detail_page.dart';
import 'package:nashe_zoloto/pages/home/home/home.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pages/auth/auth_page.dart';
import 'pages/auth/bloc/auth_bloc.dart';


void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();
  Premission();

}

Future<void> Premission() async {

  Map<Permission, PermissionStatus> permissionsCam = await [
    Permission.camera,
  ].request();
  Map<Permission, PermissionStatus> permissionsMic = await [
    Permission.microphone,
  ].request();
  Map<Permission, PermissionStatus> storage = await [
    Permission.storage,
  ].request();

  if (await Permission.storage.isGranted) {
  } else {
    var result = await Permission.storage.request();

  }

}


class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(color: Colors.black54);
}

class MyApp extends StatelessWidget {



  const MyApp({super.key});




  @override
  Widget build(BuildContext context) {
    BarcodeModel bm = BarcodeModel.fromJson({
      "code": "000-230966",
      "name": "Золотые серьги гвоздики с бриллиантами, топазами и лунными камнями",
      "prices": [
        {
          "size": "0",
          "price": 19900
        }
      ],
      "brand": "Ла Ви",
      "properties": [
        {
          "name": "Категория",
          "value": "Серьги"
        },
        {
          "name": "Подкатегория",
          "value": "Серьги гвоздики"
        },
        {
          "name": "Материал",
          "value": "Золото"
        },
        {
          "name": "Проба",
          "value": "золото 585 пробы"
        },
        {
          "name": "Цвет",
          "value": "Красный"
        },
        {
          "name": "Наличие декоративной накладки",
          "value": "0"
        },
        {
          "name": "Стадия жизни номенклатуры",
          "value": "Новый"
        },
        {
          "name": "Вставки ",
          "value": "Лунный камень, Бриллиант, Топаз, Раухтопаз"
        },
        {
          "name": "Производитель",
          "value": "Ла Ви"
        }
      ],
      "attachments": [
        {
          "name": "000-230966#1.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/WWEMs0VPNyeVxbraR91nAT3bZ8N0XBqCl1aRNldV.jpg"
        },
        {
          "name": "000-230966#2.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/6WBGYsomTBdBLxB1phnP8d1sXKE3sdOs9ixWVgQ7.jpg"
        },
        {
          "name": "000-230966#3.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/K3J8FxEmoFSIB2Icm0hBCGWR0zPGH8MthvFwUyza.jpg"
        },
        {
          "name": "000-230966#4.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/7hojei3KlZW3XcLvOmbp2oGLuewZlJRYqksAD9Gl.jpg"
        },
        {
          "name": "000-230966#5.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/8B7D8F8O2tybPYH6ctxcVHeuV0X9hOtagQhjZYcF.jpg"
        },
        {
          "name": "000-230966#6.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/9gKt7RmgPuUqAFtThbjR14RxI5FQPEOpVfEEfgKp.jpg"
        },
        {
          "name": "000-230966#7.jpg",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site/230/966/000-230966/teqx9D6QO2B6vaJjnrC34S4yp9FXPRzsuKvEpp9v.jpg"
        },
        {
          "name": "000-230966.mp4",
          "path": "https://helper_dev.ourgold.ru/public/goods_attachments/site_video/230/966/000-230966/aN7pV3EWJiiD5A2MTQ9MC0NO70zt3HkGKbS4HIHZ.mp4"
        }
      ]
    });

    return MaterialApp(
      theme: ThemeData(
        checkboxTheme: CheckboxThemeData(
          checkColor: MaterialStateProperty.resolveWith((_) => Colors.black),
          fillColor: MaterialStateProperty.resolveWith((_) => Colors.transparent),
          side: AlwaysActiveBorderSide(),
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),

        ],
        child: AuthPage(),
        // child: DetailPage(barcode: bm,),
        // child: VideoApp(),
        // child: HomePage(),
      ),
    );
  }

}

