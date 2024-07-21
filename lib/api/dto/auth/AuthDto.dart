import 'package:json_annotation/json_annotation.dart';
import 'package:vacgom_app/api/dto/auth/TokenResponse.dart';

part 'AuthDto.g.dart';

@JsonSerializable()
class LoginRequestDto {
  String accessToken;
  String? refreshToken;

  LoginRequestDto({required this.accessToken, required this.refreshToken});

  factory LoginRequestDto.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestDtoToJson(this);
}

@JsonSerializable()
class LoginResponseDto {
  TokenResponseDto token;

  LoginResponseDto({required this.token});

  factory LoginResponseDto.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseDtoToJson(this);
}
