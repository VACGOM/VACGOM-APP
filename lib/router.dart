import 'package:go_router/go_router.dart';
import 'package:vacgom_app/login/page/LoginPage.dart';
import 'package:vacgom_app/route/route_bloc.dart';
import 'package:vacgom_app/webview/page/Webview.dart';

// GoRouter configuration

GoRouter router(RouteBloc routeBloc) {
  return GoRouter(
    refreshListenable: routeBloc,
    redirect: (context, state) {
      return routeBloc.state.route;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => LoginPage(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => Webview(),
      ),
    ],
  );
}
