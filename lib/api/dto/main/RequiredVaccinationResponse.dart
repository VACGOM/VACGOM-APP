import 'package:json_annotation/json_annotation.dart';

part 'RequiredVaccinationResponse.g.dart';

@JsonSerializable()
class RequiredVaccinationResponse {
  int vaccinationId;
  String diseaseName;
  String vaccineName;
  String icon;

  RequiredVaccinationResponse({
    required this.vaccinationId,
    required this.diseaseName,
    required this.vaccineName,
    required this.icon,
  });

  factory RequiredVaccinationResponse.fromJson(Map<String, dynamic> json) =>
      _$RequiredVaccinationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RequiredVaccinationResponseToJson(this);
}
