import 'package:go_router/go_router.dart';
import 'package:nashe_zoloto/domain/router/go_router/go_router_impl.dart';
import 'package:nashe_zoloto/domain/router/models/nav_state.dart';



import 'route_constants.dart';

export 'route_constants.dart';

class RouteImpl {
  GoRouterImlt goRouterImlt;
  NavState loggedState;

  RouteImpl(this.loggedState)
      : goRouterImlt = GoRouterImlt(
    loggedState: loggedState,
    initPage: Routes.auth.name,
    authPage: Routes.auth.name,
    routes: Routes.values
        .map(
          (e) => GoRoute(
        path: '/${e.name}',
        builder: (context, GoRouterState state) =>
            RouteConstants.router(e, args: state.extra),
      ),
    )
        .toList(),
  );

  void pop() {
    goRouterImlt.router.pop();
  }

  void push(Routes? route, {Object? args}) {
    if (route != null) {
      goRouterImlt.router.push('/${route.name}', extra: args);
    }
  }

  void pushAndReplace(Routes? route, {Object? args}) {
    if (route != null) {
      goRouterImlt.router.replace('/${route.name}', extra: args);
    }
  }

  void newRoutesPath(List<Routes> routesPath, {Object? args}) {
    if (routesPath.isNotEmpty) {
      goRouterImlt.router.go(_extractPath(routesPath), extra: args);
    }
  }

  String _extractPath(List<Routes> pagesList) {
    return '/${pagesList.map((e) => e.name).join('/')}';
  }
}
