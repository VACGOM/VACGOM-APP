// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'RequiredVaccinationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RequiredVaccinationResponse _$RequiredVaccinationResponseFromJson(
        Map<String, dynamic> json) =>
    RequiredVaccinationResponse(
      vaccinationId: (json['vaccinationId'] as num).toInt(),
      diseaseName: json['diseaseName'] as String,
      vaccineName: json['vaccineName'] as String,
      icon: json['icon'] as String,
    );

Map<String, dynamic> _$RequiredVaccinationResponseToJson(
        RequiredVaccinationResponse instance) =>
    <String, dynamic>{
      'vaccinationId': instance.vaccinationId,
      'diseaseName': instance.diseaseName,
      'vaccineName': instance.vaccineName,
      'icon': instance.icon,
    };
