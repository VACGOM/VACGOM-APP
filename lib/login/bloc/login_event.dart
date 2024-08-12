part of 'login_bloc.dart';

@immutable
sealed class LoginEvent {}

class KakaoLoginButtonPressedEvent extends LoginEvent {
  KakaoLoginButtonPressedEvent();
}

class AppleLoginButtonPressedEvent extends LoginEvent {
  AppleLoginButtonPressedEvent();
}
