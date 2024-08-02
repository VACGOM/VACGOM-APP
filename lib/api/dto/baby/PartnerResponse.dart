import 'package:json_annotation/json_annotation.dart';

part 'PartnerResponse.g.dart';

@JsonSerializable()
class PartnerResponseDto {
  int id;
  String name;

  PartnerResponseDto({required this.id, required this.name});

  factory PartnerResponseDto.fromJson(Map<String, dynamic> json) =>
      _$PartnerResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$PartnerResponseDtoToJson(this);
}
