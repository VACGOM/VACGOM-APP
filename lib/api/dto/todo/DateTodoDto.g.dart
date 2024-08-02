// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'DateTodoDto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DateTodoDto _$DateTodoDtoFromJson(Map<String, dynamic> json) => DateTodoDto(
      date: json['date'] as String,
      todoList: (json['todoList'] as List<dynamic>)
          .map((e) => TodoElementDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$DateTodoDtoToJson(DateTodoDto instance) =>
    <String, dynamic>{
      'date': instance.date,
      'todoList': instance.todoList,
    };
