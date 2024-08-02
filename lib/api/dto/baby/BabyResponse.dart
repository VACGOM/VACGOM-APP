import 'package:json_annotation/json_annotation.dart';

import 'PartnerResponse.dart';

part 'BabyResponse.g.dart';

@JsonSerializable()
class BabyResponse {
  int babyId;
  bool masterStatus;
  String name;
  String birth;
  PartnerResponseDto? partner;
  String sex;

  BabyResponse(
      {required this.babyId,
      required this.masterStatus,
      required this.name,
      required this.birth,
      required this.partner,
      required this.sex});

  factory BabyResponse.fromJson(Map<String, dynamic> json) =>
      _$BabyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BabyResponseToJson(this);
}
