
import 'package:flutter/material.dart';
import 'package:nashe_zoloto/pages/auth_page.dart';


class RouteConstants {
  static router(Routes route, {Object? args}) {
    if (route == Routes.auth) {
      return AuthPage();
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
}
