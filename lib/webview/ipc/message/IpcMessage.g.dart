// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'IpcMessage.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IpcMessage<T> _$IpcMessageFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    IpcMessage<T>(
      type: json['type'] as String,
      data: fromJsonT(json['data']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$IpcMessageToJson<T>(
  IpcMessage<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'type': instance.type,
      'data': toJsonT(instance.data),
      'id': instance.id,
    };
