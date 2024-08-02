class VacgomTodoItem {
  int todoId;
  String title;
  String? memo;
  DateTime date;
  int? memberId;
  bool isDone;

  VacgomTodoItem({
    required this.todoId,
    required this.title,
    required this.date,
    required this.isDone,
    this.memo,
    this.memberId,
  });
}
