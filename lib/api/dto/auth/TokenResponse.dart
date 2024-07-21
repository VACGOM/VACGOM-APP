import 'package:json_annotation/json_annotation.dart';

part 'TokenResponse.g.dart';

@JsonSerializable()
class TokenResponseDto {
  String accessToken;

  TokenResponseDto({required this.accessToken});

  factory TokenResponseDto.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TokenResponseDtoToJson(this);
}
