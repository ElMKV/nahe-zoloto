import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nashe_zoloto/injection_container.dart';
import 'package:nashe_zoloto/pages/bloc/auth_bloc.dart';

import 'pages/auth_page.dart';


void main() {
  runApp(const MyApp());
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

