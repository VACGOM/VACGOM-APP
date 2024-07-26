import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/calendar/page/CalendarPage.dart';
import 'package:vacgom_app/login/page/LoginPage.dart';
import 'package:vacgom_app/onboarding/page/OnboardingOptionPage.dart';
import 'package:vacgom_app/onboarding/page/OnboardingPage.dart';
import 'package:vacgom_app/page/Splash.dart';
import 'package:vacgom_app/route/route_bloc.dart';
import 'package:vacgom_app/scaffold.dart';
import 'package:vacgom_app/webview/page/Webview.dart';
import 'package:vacgom_app/webview/page/home.dart';
import 'package:vacgom_app/webview/page/home2.dart';

// GoRouter configuration

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

GoRouter router(RouteBloc routeBloc) {
  return GoRouter(
      initialLocation: "/splash",
      navigatorKey: _rootNavigatorKey,
      debugLogDiagnostics: true,
      refreshListenable: routeBloc,
      redirect: (context, state) {
        return routeBloc.state.route;
      },
      routes: [
        GoRoute(path: "/splash", builder: (context, state) => SplashPage()),
        GoRoute(
          path: "/login",
          builder: (context, state) => LoginPage(),
        ),
        GoRoute(
          path: "/onboarding",
          builder: (context, state) => OnboardingPage(),
        ),
        GoRoute(
          path: "/onboarding/option",
          builder: (context, state) => OnboardingOptionPage(),
        ),
        GoRoute(
          path: "/webview-full",
          builder: (context, state) => Webview(),
        ),
        StatefulShellRoute.indexedStack(
          builder: (BuildContext context, GoRouterState state,
              StatefulNavigationShell navigationShell) {
            return ScaffoldWith(navigationShell: navigationShell);
          },
          branches: [
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/webview",
                builder: (context, state) => Webview(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/home",
                builder: (context, state) => Home(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/calendar",
                builder: (context, state) => CalendarPage(),
              ),
            ]),
            StatefulShellBranch(routes: [
              GoRoute(
                path: "/webview",
                builder: (context, state) => CalendarPage(),
              ),
            ])
          ],
        ),
      ]);
}
