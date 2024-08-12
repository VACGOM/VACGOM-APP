import 'package:json_annotation/json_annotation.dart';

part 'CreateTodo.g.dart';

@JsonSerializable()
class CreateTodo {
  String title;

  String date;

  CreateTodo({
    required this.title,
    required this.date,
  });

  factory CreateTodo.fromJson(Map<String, dynamic> json) =>
      _$CreateTodoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTodoToJson(this);
}
