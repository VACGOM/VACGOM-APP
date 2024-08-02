// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MemberResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberResponseDto _$MemberResponseDtoFromJson(Map<String, dynamic> json) =>
    MemberResponseDto(
      id: (json['id'] as num).toInt(),
      role: json['role'] as String,
      name: json['name'] as String?,
      babyName: json['babyName'] as String?,
    );

Map<String, dynamic> _$MemberResponseDtoToJson(MemberResponseDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'role': instance.role,
      'name': instance.name,
      'babyName': instance.babyName,
    };
