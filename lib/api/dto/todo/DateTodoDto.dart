import 'package:json_annotation/json_annotation.dart';

import 'TodoElementDto.dart';
part 'DateTodoDto.g.dart';

@JsonSerializable()
class DateTodoDto {
  String date;
  List<TodoElementDto> todoList;

  DateTodoDto({
    required this.date,
    required this.todoList,
  });

  factory DateTodoDto.fromJson(Map<String, dynamic> json) =>
      _$DateTodoDtoFromJson(json);

  Map<String, dynamic> toJson() => _$DateTodoDtoToJson(this);
}
