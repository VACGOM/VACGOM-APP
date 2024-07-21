import 'package:dio/dio.dart';

import '../auth/auth_bloc.dart';

class AuthDio {
  final Dio _dio;
  final AuthBloc _authBloc;

  AuthDio(this._dio, this._authBloc) {
    String? accessToken = null;
    _authBloc.on<AuthTokenChanged>((event, emit) {
      accessToken = event.token.accessToken;
      print("엑세서 토큰 반영함");
    });

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = accessToken;
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        handler.next(options);
      },
    ));
  }
}
