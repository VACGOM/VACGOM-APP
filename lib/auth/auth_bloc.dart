import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:vacgom_app/auth/repository/TokenRepository.dart';
import 'package:vacgom_app/auth/repository/UserRepository.dart';

import '../api/api.dart';
import '../login/model/AuthToken.dart';
import 'model/PartnerUser.dart';
import 'model/User.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final TokenRepository tokenRepository = TokenRepository();

  UserRepository userRepository;

  AuthBloc(this.userRepository) : super(AuthState.unauthenticated()) {
    on<AppStarted>((event, emit) async {
      print("app started");
      emit(AuthState.loading());
      await Future.delayed(Duration(seconds: 1));
      String? token = await tokenRepository.getToken();

      print(token);
      print("tok ");
      if (token == null) {
        print("tok null");

        emit(AuthState.unauthenticated());
      } else {
        Map<String, dynamic> user = JwtDecoder.decode(token);
        print("user");

        try {
          final user1 = await userRepository.fetchUser(token);
          print("user1");
          print(user1);
          if (user1.role == "ROLE_USER") {
            try {
              final baby = await userRepository.restClient.getBaby();
              emit(AuthState.authenticated(User(
                  id: int.parse(user["sub"]),
                  role: user["role"],
                  name: user1.name,
                  babyName: user1.babyName,
                  profileImageUrl:
                      "https://avatars.githubusercontent.com/u/77490557?v=4",
                  color: "#4196FD",
                  isMaster: baby.data.masterStatus,
                  partnerUser: baby.data.partner != null
                      ? PartnerUser(
                          id: baby.data.partner!.id,
                          name: baby.data.partner!.name,
                          isMaster: !baby.data.masterStatus,
                        )
                      : null)));
            } catch (e) {
              emit(AuthState.authenticated(User(
                  id: int.parse(user["sub"]),
                  role: user["role"],
                  name: user1.name,
                  babyName: user1.babyName,
                  profileImageUrl:
                      "https://avatars.githubusercontent.com/u/77490557?v=4",
                  color: "#4196FD",
                  isMaster: false,
                  partnerUser: null)));
            }
          } else {
            emit(AuthState.authenticated(User(
              id: int.parse(user["sub"]),
              role: user["role"],
              name: user1.name,
              babyName: user1.babyName,
              profileImageUrl:
                  "https://avatars.githubusercontent.com/u/77490557?v=4",
              color: "#4196FD",
              isMaster: false,
              partnerUser: null,
            )));
          }
        } catch (e) {
          print(e);
          print("UNauth");

          emit(AuthState.unauthenticated());
        }
      }
    });

    on<AuthTokenChanged>((event, emit) async {
      print("auth token changed");
      await tokenRepository.saveToken(event.token.accessToken);
      final user1 = await userRepository.fetchUser(event.token.accessToken);
      print(user1);
      Map<String, dynamic> user = JwtDecoder.decode(event.token.accessToken);
      print(user);
      if (user1.role == "ROLE_USER") {
        try {
          final baby = await userRepository.restClient.getBaby();
          emit(AuthState.authenticated(User(
              id: int.parse(user["sub"]),
              role: user["role"],
              name: user1.name,
              babyName: user1.babyName,
              profileImageUrl:
                  "https://avatars.githubusercontent.com/u/77490557?v=4",
              color: "#4196FD",
              isMaster: baby.data.masterStatus,
              partnerUser: baby.data.partner != null
                  ? PartnerUser(
                      id: baby.data.partner!.id,
                      name: baby.data.partner!.name,
                      isMaster: !baby.data.masterStatus,
                    )
                  : null)));
        } catch (e) {
          emit(AuthState.authenticated(User(
              id: int.parse(user["sub"]),
              role: user["role"],
              name: user1.name,
              babyName: user1.babyName,
              profileImageUrl:
                  "https://avatars.githubusercontent.com/u/77490557?v=4",
              color: "#4196FD",
              isMaster: false,
              partnerUser: null)));
        }
      } else {
        emit(AuthState.authenticated(User(
          id: int.parse(user["sub"]),
          role: user["role"],
          name: user1.name,
          babyName: user1.babyName,
          profileImageUrl:
              "https://avatars.githubusercontent.com/u/77490557?v=4",
          color: "#4196FD",
          isMaster: false,
          partnerUser: null,
        )));
      }
    });

    on<LogoutRequested>((event, emit) async {
      print("logout requestd");
      await tokenRepository.deleteToken();
      emit(AuthState.unauthenticated());
    });

    on<OnBoardingCompleted>((event, emit) async {
      print("OnBoardingCompleted");
      String? token = await tokenRepository.getToken();

      final client = RestClient(
          Dio(BaseOptions(headers: {"Authorization": "Bearer ${token}"})));

      final response = await client.claimNewToken();

      await tokenRepository.saveToken(response.data.accessToken);

      Map<String, dynamic> user = JwtDecoder.decode(response.data.accessToken);

      final user1 = await userRepository.fetchUser(response.data.accessToken);
      if (user1.role == "ROLE_USER") {
        try {
          final baby = await userRepository.restClient.getBaby();
          emit(AuthState.authenticated(User(
              id: int.parse(user["sub"]),
              role: user["role"],
              name: user1.name,
              babyName: user1.babyName,
              profileImageUrl:
                  "https://avatars.githubusercontent.com/u/77490557?v=4",
              color: "#4196FD",
              isMaster: baby.data.masterStatus,
              partnerUser: baby.data.partner != null
                  ? PartnerUser(
                      id: baby.data.partner!.id,
                      name: baby.data.partner!.name,
                      isMaster: !baby.data.masterStatus,
                    )
                  : null)));
        } catch (e) {
          emit(AuthState.authenticated(User(
              id: int.parse(user["sub"]),
              role: user["role"],
              name: user1.name,
              babyName: user1.babyName,
              profileImageUrl:
                  "https://avatars.githubusercontent.com/u/77490557?v=4",
              color: "#4196FD",
              isMaster: false,
              partnerUser: null)));
        }
      } else {
        emit(AuthState.authenticated(User(
          id: int.parse(user["sub"]),
          role: user["role"],
          name: user1.name,
          babyName: user1.babyName,
          profileImageUrl:
              "https://avatars.githubusercontent.com/u/77490557?v=4",
          color: "#4196FD",
          isMaster: false,
          partnerUser: null,
        )));
      }
    });

    on<AuthStateChanged>((event, emit) async {
      print("AuthStateChanged");
      String? token = await tokenRepository.getToken();
      print(token);
      if (token == null) {
        emit(AuthState.unauthenticated());
      } else {
        Map<String, dynamic> user = JwtDecoder.decode(token);
        final user1 = await userRepository.fetchUser(token);
        print(user1);
        if (user1.role == "ROLE_USER") {
          try {
            final baby = await userRepository.restClient.getBaby();
            emit(AuthState.authenticated(User(
                id: int.parse(user["sub"]),
                role: user["role"],
                name: user1.name,
                babyName: user1.babyName,
                profileImageUrl:
                    "https://avatars.githubusercontent.com/u/77490557?v=4",
                color: "#4196FD",
                isMaster: baby.data.masterStatus,
                partnerUser: baby.data.partner != null
                    ? PartnerUser(
                        id: baby.data.partner!.id,
                        name: baby.data.partner!.name,
                        isMaster: !baby.data.masterStatus,
                      )
                    : null)));
          } catch (e) {
            emit(AuthState.authenticated(User(
                id: int.parse(user["sub"]),
                role: user["role"],
                name: user1.name,
                babyName: user1.babyName,
                profileImageUrl:
                    "https://avatars.githubusercontent.com/u/77490557?v=4",
                color: "#4196FD",
                isMaster: false,
                partnerUser: null)));
          }
        } else {
          emit(AuthState.authenticated(User(
            id: int.parse(user["sub"]),
            role: user["role"],
            name: user1.name,
            babyName: user1.babyName,
            profileImageUrl:
                "https://avatars.githubusercontent.com/u/77490557?v=4",
            color: "#4196FD",
            isMaster: false,
            partnerUser: null,
          )));
        }
      }
    });
  }

  Stream<AuthState> getStream() {
    return this.stream.asBroadcastStream();
  }
}
