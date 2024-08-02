import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

import '../auth/repository/TokenRepository.dart';
import '../scaffold.dart';

class DioInterceptor extends Interceptor {
  final AuthBloc _authBloc;

  DioInterceptor(this._authBloc);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print(err);
    showDialog(
      context: ScaffoldWith.navigatorKey.currentContext!!,
      builder: (e) {
        return AlertDialog(
          title: Text("요청오류"),
          content: Text("${err.message} ${err.response?.data.toString()}"),
          actions: [
            TextButton(
              onPressed: () {
                _authBloc.add(LogoutRequested());
              },
              child: Text("로그아웃"),
            ),
          ],
        );
      },
    );
    print(err.response);
    if (err.response?.statusCode == 401) {
      print(err);

      throw err;
    }

    throw err;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final tokenRepository = TokenRepository();
    final token = await tokenRepository.getToken();
    print("token: $token");
    if (token != null) {
      options.headers["Authorization"] = "Bearer ${token}";
    }

    handler.next(options);
  }
}
