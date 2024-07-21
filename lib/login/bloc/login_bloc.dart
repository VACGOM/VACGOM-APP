import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vacgom_app/login/model/AuthToken.dart';
import 'package:vacgom_app/login/model/KakaoOauthToken.dart';
import 'package:vacgom_app/login/service/KakaoService.dart';

import '../service/AuthService.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(KakaoService kakaoService, AuthService authService)
      : super(LoginInitial()) {
    on<KakaoLoginButtonPressedEvent>((event, emit) async {
      try {
        KakaoOauthToken token = await kakaoService.login();
        AuthToken authToken = await authService.kakaoLogin(token);

        emit(LoginSuccess(authToken));
      } catch (e) {
        print(e);
        emit(LoginFailure());
      }
    });
  }
}
