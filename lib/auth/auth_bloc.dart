import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
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
      await Future.delayed(Duration(seconds: 1));
      String? token = await tokenRepository.getToken();

      if (token == null) {
        emit(AuthState.unauthenticated());
      } else {
        Map<String, dynamic> user = JwtDecoder.decode(token);
        print(user);

        emit(AuthState.authenticated(User(
            id: int.parse(user["sub"]),
            role: user["role"],
            name: "형쥬",
            profileImageUrl:
                "https://avatars.githubusercontent.com/u/77490557?v=4",
            color: "#4196FD")));
      }
    });

    on<AuthTokenChanged>((event, emit) async {
      await tokenRepository.saveToken(event.token.accessToken);
      Map<String, dynamic> user = JwtDecoder.decode(event.token.accessToken);
      emit(AuthState.authenticated(User(
        id: int.parse(user["sub"]),
        role: user["role"],
        name: "형쥬",
        profileImageUrl: "https://avatars.githubusercontent.com/u/77490557?v=4",
        color: "#4196FD",
      )));
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
