
import 'package:flutter/material.dart';
import 'package:nashe_zoloto/pages/auth/auth_page.dart';
import 'package:nashe_zoloto/pages/home/home.dart';


class RouteConstants {
  static router(Routes route, {Object? args}) {
    if (route == Routes.auth) {
      return AuthPage();
    }
    else if (route == Routes.home) {
      return const HomePage();
    } else {
      return Scaffold(
        appBar: AppBar(title: const Text('404')),
        body: const Center(child: Text('Page not found')),
      );
    }
  }
}

enum Routes {
  auth,
  home,
}
