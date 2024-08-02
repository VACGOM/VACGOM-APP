// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'TodoElementDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TodoElementDto _$TodoElementDtoFromJson(Map<String, dynamic> json) =>
    TodoElementDto(
      todoId: (json['todoId'] as num).toInt(),
      title: json['title'] as String,
      date: DateTime.parse(json['date'] as String),
      isDone: json['isDone'] as bool,
      memo: json['memo'] as String?,
      memberId: (json['memberId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TodoElementDtoToJson(TodoElementDto instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'title': instance.title,
      'memo': instance.memo,
      'date': instance.date.toIso8601String(),
      'memberId': instance.memberId,
      'isDone': instance.isDone,
    };
