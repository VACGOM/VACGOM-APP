import 'package:json_annotation/json_annotation.dart';

part 'MemberResponse.g.dart';

@JsonSerializable()
class MemberResponseDto {
  final int id;
  final String role;
  final String? name;
  final String? babyName;

  MemberResponseDto(
      {required this.id,
      required this.role,
      required this.name,
      required this.babyName});

  factory MemberResponseDto.fromJson(Map<String, dynamic> json) =>
      _$MemberResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$MemberResponseDtoToJson(this);
}
