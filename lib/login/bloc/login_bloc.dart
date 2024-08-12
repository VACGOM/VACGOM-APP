import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:vacgom_app/login/model/AuthToken.dart';
import 'package:vacgom_app/login/model/KakaoOauthToken.dart';
import 'package:vacgom_app/login/service/KakaoService.dart';

import '../service/AuthService.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc(KakaoService kakaoService, AuthService authService)
      : super(LoginInitial()) {
    on<AppleLoginButtonPressedEvent>((event, emit) async {
      try {
        final credential = await SignInWithApple.getAppleIDCredential(scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ]);
        AuthToken authToken =
            await authService.appleLogin(credential.authorizationCode);
        emit(LoginSuccess(authToken));
      } catch (e) {
        print(e);
        emit(LoginFailure());
      }
    });
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
