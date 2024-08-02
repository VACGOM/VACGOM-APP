// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'BabyResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BabyResponse _$BabyResponseFromJson(Map<String, dynamic> json) => BabyResponse(
      babyId: (json['babyId'] as num).toInt(),
      masterStatus: json['masterStatus'] as bool,
      name: json['name'] as String,
      birth: json['birth'] as String,
      partner: json['partner'] == null
          ? null
          : PartnerResponseDto.fromJson(
              json['partner'] as Map<String, dynamic>),
      sex: json['sex'] as String,
    );

Map<String, dynamic> _$BabyResponseToJson(BabyResponse instance) =>
    <String, dynamic>{
      'babyId': instance.babyId,
      'masterStatus': instance.masterStatus,
      'name': instance.name,
      'birth': instance.birth,
      'partner': instance.partner,
      'sex': instance.sex,
    };
