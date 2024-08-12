import 'package:dio/dio.dart';
import 'package:vacgom_app/api/api.dart';
import 'package:vacgom_app/api/dto/auth/AuthDto.dart';
import 'package:vacgom_app/login/model/AuthToken.dart';
import 'package:vacgom_app/login/model/KakaoOauthToken.dart';

import '../../api/dto/BaseResponse.dart';

class AuthService {
  Future<AuthToken> kakaoLogin(KakaoOauthToken token) async {
    RestClient restClient = RestClient(Dio());
    BaseResponse<LoginResponseDto> response = await restClient.login(
        LoginRequestDto(
            accessToken: token.accessToken, refreshToken: token.refreshToken));

    return AuthToken(response.data.token.accessToken);
  }

  Future<AuthToken> appleLogin(String authorizationCode) async {
    RestClient restClient = RestClient(Dio());
    BaseResponse<LoginResponseDto> response = await restClient.loginApple(
        LoginRequestDto(accessToken: authorizationCode, refreshToken: null));

    return AuthToken(response.data.token.accessToken);
  }
}
