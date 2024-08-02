import 'package:json_annotation/json_annotation.dart';

part 'TodoElementDto.g.dart';

@JsonSerializable()
class TodoElementDto {
  int todoId;
  String title;
  String? memo;
  DateTime date;
  int? memberId;
  bool isDone;

  TodoElementDto({
    required this.todoId,
    required this.title,
    required this.date,
    required this.isDone,
    this.memo,
    this.memberId,
  });

  factory TodoElementDto.fromJson(Map<String, dynamic> json) =>
      _$TodoElementDtoFromJson(json);

  Map<String, dynamic> toJson() => _$TodoElementDtoToJson(this);
}
