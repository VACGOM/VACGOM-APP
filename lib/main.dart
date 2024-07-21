import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/auth/auth_observer.dart';
import 'package:vacgom_app/login/service/AuthService.dart';
import 'package:vacgom_app/route/route_bloc.dart';

import 'login/bloc/login_bloc.dart';
import 'login/service/KakaoService.dart';
import 'router.dart';

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
  MyApp({super.key});

  final AuthBloc authBloc = AuthBloc();
  final RouteBloc routeBloc = RouteBloc();

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
      ],
      child: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.isAuthenticated) {
            routeBloc.add(Navigate("/home"));
          } else {
            routeBloc.add(Navigate('/'));
          }
        },
        child: MaterialApp.router(
          routerConfig: router(routeBloc),
        ),
      ),
    );
  }
}
