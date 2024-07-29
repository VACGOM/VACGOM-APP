import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/auth/auth_observer.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/login/service/AuthService.dart';
import 'package:vacgom_app/onboarding/bloc/onboarding_bloc.dart';
import 'package:vacgom_app/route/route_bloc.dart';
import 'package:vacgom_app/router.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';
import 'package:vacgom_app/webview/statusbar/statusbar_bloc.dart';

import 'login/bloc/login_bloc.dart';
import 'login/service/KakaoService.dart';

void init() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '154cafad8501e64666049ea4cc214b88',
  );

  final dio = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));
}

void main() {
  init();
  Bloc.observer = AuthObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  late AuthBloc authBloc;
  late RouteBloc routeBloc;
  late GoRouter goRouter;
  late WebViewRouteBloc webViewRouteBloc;

  MyApp() {
    this.authBloc = AuthBloc();
    this.routeBloc = RouteBloc();

    this.goRouter = router(this.routeBloc);
    this.webViewRouteBloc = WebViewRouteBloc();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(KakaoService(), AuthService()),
        ),
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => authBloc..add(AppStarted()),
        ),
        BlocProvider<RouteBloc>(create: (context) => routeBloc),
        BlocProvider<WebViewRouteBloc>(create: (context) => webViewRouteBloc),
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<StatusbarBloc>(
          create: (context) => StatusbarBloc(),
        ),
        BlocProvider<CalendarBloc>(
            lazy: false, create: (context) => CalendarBloc()..add(InitEvent()))
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebViewRouteBloc, WebViewRouteState>(
              listener: (context, state) {
            if (state.showBottomBar) {
              if (state.isReplace)
                goRouter.go("/webview");
              else
                goRouter.push("/webview");
            } else {
              if (state.isReplace)
                goRouter.go("/webview-full");
              else
                goRouter.push("/webview-full");
            }
          }),
          BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state.isLoading) return;
              if (state.isAuthenticated) {
                if (state.user.role == "ROLE_USER")
                  routeBloc.add(Navigate("/home"));
                else
                  routeBloc.add(Navigate("/onboarding"));
              } else {
                routeBloc.add(Navigate('/login'));
              }
            },
          ),
        ],
        child: ScreenUtilInit(
          designSize: Size(393, 852),
          child: MaterialApp.router(
            theme: ThemeData(
                colorScheme:
                    ColorScheme.fromSwatch(backgroundColor: Color(0xFFF9FAFB))),
            routerConfig: goRouter,
          ),
        ),
      ),
    );
  }
}
