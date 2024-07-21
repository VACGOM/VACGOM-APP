import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:vacgom_app/api/dto/auth/AuthDto.dart';

import '../constants.dart';
import 'dto/BaseResponse.dart';

part 'api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST("${BASE_URL_V2}/api/v2/oauth/KAKAO/login")
  Future<BaseResponse<LoginResponseDto>> login(
      @Body() LoginRequestDto loginRequestDto);
}
