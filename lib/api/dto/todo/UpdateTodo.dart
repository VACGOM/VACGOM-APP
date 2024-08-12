import 'package:json_annotation/json_annotation.dart';

part 'UpdateTodo.g.dart';

@JsonSerializable()
class UpdateTodo {
  int todoId;
  bool isDone;

  UpdateTodo({
    required this.todoId,
    required this.isDone,
  });

  factory UpdateTodo.fromJson(Map<String, dynamic> json) =>
      _$UpdateTodoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateTodoToJson(this);
}
