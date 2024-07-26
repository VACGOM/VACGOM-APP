class TodoResponse {
  int id;
  String title;
  String? memo;
  DateTime date;
  int? userId;
  bool isDone;

  TodoResponse({
    required this.id,
    required this.title,
    this.memo,
    required this.date,
    required this.userId,
    required this.isDone,
  });
}
