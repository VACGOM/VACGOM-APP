// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inoculationResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InoculationResponse _$InoculationResponseFromJson(Map<String, dynamic> json) =>
    InoculationResponse(
      requiredInoculationCnt: (json['requiredInoculationCnt'] as num).toInt(),
      inoculatedCnt: (json['inoculatedCnt'] as num).toInt(),
    );

Map<String, dynamic> _$InoculationResponseToJson(
        InoculationResponse instance) =>
    <String, dynamic>{
      'requiredInoculationCnt': instance.requiredInoculationCnt,
      'inoculatedCnt': instance.inoculatedCnt,
    };
