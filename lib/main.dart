import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:vacgom_app/api/api.dart';
import 'package:vacgom_app/api/dioInterceptor.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/auth/auth_observer.dart';
import 'package:vacgom_app/auth/repository/UserRepository.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/bottomsheet/bottom_sheet_bloc.dart';
import 'package:vacgom_app/login/service/AuthService.dart';
import 'package:vacgom_app/onboarding/bloc/onboarding_bloc.dart';
import 'package:vacgom_app/route/route_bloc.dart';
import 'package:vacgom_app/router.dart';
import 'package:vacgom_app/webview/page/main/main_bloc.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';
import 'package:vacgom_app/webview/statusbar/statusbar_bloc.dart';

import 'login/bloc/login_bloc.dart';
import 'login/service/KakaoService.dart';

void init() {
  WidgetsFlutterBinding.ensureInitialized();

  KakaoSdk.init(
    nativeAppKey: '154cafad8501e64666049ea4cc214b88',
  );
}

void main() {
  init();
  Bloc.observer = AuthObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static GlobalKey<NavigatorState> ma = GlobalKey();
  late AuthBloc authBloc;
  late RouteBloc routeBloc;
  late GoRouter goRouter;
  late WebViewRouteBloc webViewRouteBloc;
  late UserRepository userRepository;
  late RestClient restClient;

  MyApp() {
    final dio = Dio();

    restClient = RestClient(dio);
    this.routeBloc = RouteBloc();

    this.userRepository = UserRepository(restClient);
    authBloc = AuthBloc(userRepository);
    dio.interceptors.add(DioInterceptor(authBloc));
    this.goRouter = router(this.routeBloc);
    this.webViewRouteBloc = WebViewRouteBloc();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        RepositoryProvider<RestClient>(create: (context) {
          return restClient;
        }),
        BlocProvider<LoginBloc>(
          create: (context) => LoginBloc(KakaoService(), AuthService()),
        ),
        BlocProvider<AuthBloc>(
          lazy: false,
          create: (context) => AuthBloc(userRepository)..add(AppStarted()),
        ),
        BlocProvider<RouteBloc>(create: (context) => routeBloc),
        BlocProvider<WebViewRouteBloc>(create: (context) => webViewRouteBloc),
        BlocProvider<OnboardingBloc>(create: (context) => OnboardingBloc()),
        BlocProvider<StatusbarBloc>(
          create: (context) => StatusbarBloc(),
        ),
        BlocProvider<CalendarBloc>(
            create: (context) => CalendarBloc(restClient)..add(InitEvent())),
        BlocProvider<MainBloc>(create: (context) => MainBloc(restClient)),
        BlocProvider<BottomSheetBloc>(create: (context) => BottomSheetBloc())
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<WebViewRouteBloc, WebViewRouteState>(
              listener: (context, state) {
            if (state.showBottomBar) {
              if (state.isReplace)
                goRouter.go("/onboarding");
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
              print(state.user?.role);
              print("bloc listener");
              print(state.user);
              if (state.isLoading) return;
              if (state.user != null) {
                if (state.user?.role == "ROLE_USER")
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
                bottomSheetTheme: BottomSheetThemeData(
                    backgroundColor: Colors.transparent,
                    surfaceTintColor: Colors.transparent,
                    modalBarrierColor: Color(0x7F191F28),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
                colorScheme:
                    ColorScheme.fromSwatch(backgroundColor: Color(0xFFF9FAFB))),
            routerConfig: goRouter,
          ),
        ),
      ),
    );
  }
}
