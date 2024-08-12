import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:vacgom_app/api/dto/auth/AuthDto.dart';
import 'package:vacgom_app/api/dto/auth/TokenResponse.dart';
import 'package:vacgom_app/api/dto/baby/BabyResponse.dart';
import 'package:vacgom_app/api/dto/main/MainResponse.dart';
import 'package:vacgom_app/api/dto/todo/CreateTodo.dart';
import 'package:vacgom_app/api/dto/todo/UpdateTodo.dart';

import '../constants.dart';
import 'dto/BaseResponse.dart';
import 'dto/auth/MemberResponse.dart';
import 'dto/todo/DateTodoDto.dart';

part 'api.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("${BASE_URL_V2}/api/v2/member")
  Future<BaseResponse<MemberResponseDto>> getUser();

  @GET("${BASE_URL_V2}/api/v2/member/baby")
  Future<BaseResponse<BabyResponse>> getBaby();

  @GET("${BASE_URL_V2}/api/v2/main")
  Future<BaseResponse<MainResponse>> getMain();

  @POST("${BASE_URL_V2}/api/v2/auth/token")
  Future<BaseResponse<TokenResponseDto>> claimNewToken();

  @DELETE("${BASE_URL_V2}/api/v2/auth/signout")
  Future<void> deleteUser();

  @GET("${BASE_URL_V2}/api/v2/calender/todo")
  Future<BaseResponse<List<DateTodoDto>>> getTodo();

  @POST("${BASE_URL_V2}/api/v2/calender/todo")
  Future<void> addTodo(@Body() CreateTodo createTodo);

  @PATCH("${BASE_URL_V2}/api/v2/calender/todo/")
  Future<void> updateTodo(@Body() UpdateTodo createTodo);

  @POST("${BASE_URL_V2}/api/v2/oauth/KAKAO/login")
  Future<BaseResponse<LoginResponseDto>> login(
      @Body() LoginRequestDto loginRequestDto);

  @POST("${BASE_URL_V2}/api/v2/oauth/APPLE/login")
  Future<BaseResponse<LoginResponseDto>> loginApple(
      @Body() LoginRequestDto loginRequestDto);
}
