// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MainResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MainResponse _$MainResponseFromJson(Map<String, dynamic> json) => MainResponse(
      inoculationResponse: InoculationResponse.fromJson(
          json['inoculationResponse'] as Map<String, dynamic>),
      requiredVaccinationResponse: RequiredVaccinationResponse.fromJson(
          json['requiredVaccinationResponse'] as Map<String, dynamic>),
      vacgomScore: (json['vacgomScore'] as num).toInt(),
    );

Map<String, dynamic> _$MainResponseToJson(MainResponse instance) =>
    <String, dynamic>{
      'inoculationResponse': instance.inoculationResponse,
      'requiredVaccinationResponse': instance.requiredVaccinationResponse,
      'vacgomScore': instance.vacgomScore,
    };
