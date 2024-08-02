// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'PartnerResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PartnerResponseDto _$PartnerResponseDtoFromJson(Map<String, dynamic> json) =>
    PartnerResponseDto(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PartnerResponseDtoToJson(PartnerResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
