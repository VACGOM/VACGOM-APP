import 'package:json_annotation/json_annotation.dart';

import 'RequiredVaccinationResponse.dart';
import 'inoculationResponse.dart';

part 'MainResponse.g.dart';

@JsonSerializable()
class MainResponse {
  InoculationResponse inoculationResponse;
  RequiredVaccinationResponse requiredVaccinationResponse;
  int vacgomScore;

  MainResponse({
    required this.inoculationResponse,
    required this.requiredVaccinationResponse,
    required this.vacgomScore,
  });

  factory MainResponse.fromJson(Map<String, dynamic> json) =>
      _$MainResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MainResponseToJson(this);
}
