part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AppStarted extends AuthEvent {}

final class AuthTokenChanged extends AuthEvent {
  final AuthToken token;

  AuthTokenChanged(this.token);
}

final class LogoutRequested extends AuthEvent {}
