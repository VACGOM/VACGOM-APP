import 'package:json_annotation/json_annotation.dart';

part 'inoculationResponse.g.dart';

@JsonSerializable()
class InoculationResponse {
  int requiredInoculationCnt;
  int inoculatedCnt;

  InoculationResponse({
    required this.requiredInoculationCnt,
    required this.inoculatedCnt,
  });

  factory InoculationResponse.fromJson(Map<String, dynamic> json) =>
      _$InoculationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$InoculationResponseToJson(this);
}
