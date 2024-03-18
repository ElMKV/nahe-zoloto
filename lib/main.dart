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

