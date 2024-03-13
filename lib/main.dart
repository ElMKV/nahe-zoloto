import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/injection_container.dart';
import 'package:nashe_zoloto/pages/bloc/auth_bloc.dart';

import 'pages/auth_page.dart';


void main() {
  runApp(const MyApp());
  HttpOverrides.global = MyHttpOverrides();

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
      title: 'Movie App',
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AuthBloc>(),
          ),

        ],
        child: AuthPage(),
      ),
    );
  }
}

