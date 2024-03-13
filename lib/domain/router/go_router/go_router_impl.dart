// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../models/nav_state.dart';

class GoRouterImlt {
  GoRouterImlt({
    required this.routes,
    required this.initPage,
    required this.authPage,
    // required this.initName,
    required this.loggedState,
  }) : router = GoRouter(
          debugLogDiagnostics: kDebugMode,
          initialLocation: '/$initPage',
          routes: routes,
          // <GoRoute>[
          //   GoRoute(
          //     path: initName,
          //     builder: (BuildContext context, GoRouterState state) => initPage,
          //     routes: routes,
          //   ),
          // ],
          redirect: (BuildContext context, state) {
            // if the user is not logged in, they need to login
            bool? loggedIn = loggedState.state;
            bool loggingIn = state.subloc == '/$authPage';

            // bundle the location the user is coming from into a query parameter
            // final fromp = state.subloc == '/' ? '' : '?from=${state.subloc}';
            if (loggedIn == false) return loggingIn ? null : '/$authPage';

            // if the user is logged in, send them where they were going before (or
            // home if they weren't going anywhere)
            // if (loggingIn == true) return state.queryParams['from'] ?? '/';

            // no need to redirect at all
            return null;
          },
          // changes on the listenable will cause the router to refresh it's route
          refreshListenable: loggedState,
        );

  // String initName;
  String authPage;
  List<GoRoute> routes;
  String initPage;
  GoRouter router;
  NavState loggedState;
}

class GoRouterRefreshStreamCustom extends ChangeNotifier {
  GoRouterRefreshStreamCustom(Stream<dynamic> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
      (data) {
        if (data is NavState) {
          notifyListeners();
        }
      },
    );
  }

  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
