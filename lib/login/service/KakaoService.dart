import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:vacgom_app/login/model/KakaoOauthToken.dart';

class KakaoService {
  Future<OAuthToken> _tryLogin() async {
    if (await isKakaoTalkInstalled()) {
      return await UserApi.instance.loginWithKakaoTalk();
    } else {
      return await UserApi.instance.loginWithKakaoAccount();
    }
  }

  Future<KakaoOauthToken> login() async {
    try {
      final OAuthToken token = await _tryLogin();

      return KakaoOauthToken(token.accessToken, token.refreshToken);
    } catch (e) {
      throw Exception('Failed to login with Kakao: $e');
    }
  }
}
