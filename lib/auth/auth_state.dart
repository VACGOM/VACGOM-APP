part of 'auth_bloc.dart';

class AuthState extends Equatable {
  bool isAuthenticated;
  bool isLoading;
  User user;

  AuthState(this.isAuthenticated, this.isLoading, this.user);

  static AuthState initial() {
    return AuthState(false, false, User.empty());
  }

  static AuthState loading() {
    return AuthState(false, true, User.empty());
  }

  static AuthState unauthenticated() {
    return AuthState(false, false, User.empty());
  }

  static AuthState authenticated(User user) {
    return AuthState(true, false, user);
  }

  @override
  List<Object?> get props => [isAuthenticated, isLoading, user];
}
