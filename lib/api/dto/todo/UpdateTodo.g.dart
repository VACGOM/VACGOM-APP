// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'UpdateTodo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateTodo _$UpdateTodoFromJson(Map<String, dynamic> json) => UpdateTodo(
      todoId: (json['todoId'] as num).toInt(),
      isDone: json['isDone'] as bool,
    );

Map<String, dynamic> _$UpdateTodoToJson(UpdateTodo instance) =>
    <String, dynamic>{
      'todoId': instance.todoId,
      'isDone': instance.isDone,
    };
