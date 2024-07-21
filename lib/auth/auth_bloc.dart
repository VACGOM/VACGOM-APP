import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';

import '../login/model/AuthToken.dart';
import 'model/User.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenRepository tokenRepository = TokenRepository();

  AuthBloc() : super(AuthState.unauthenticated()) {
    on<AppStarted>((event, emit) async {
      emit(AuthState.loading());
      String? token = await tokenRepository.getToken();
      if (token == null) {
        emit(AuthState.unauthenticated());
      } else {
        emit(AuthState.authenticated(User.empty()));
      }
    });

    on<AuthTokenChanged>((event, emit) async {
      await tokenRepository.saveToken(event.token.accessToken);
      emit(AuthState.authenticated(User.empty()));
    });

    on<LogoutRequested>((event, emit) async {
      await tokenRepository.deleteToken();
      emit(AuthState.unauthenticated());
    });
  }

  Stream<AuthState> getStream() {
    return this.stream.asBroadcastStream();
  }
}
