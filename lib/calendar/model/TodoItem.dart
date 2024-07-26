import 'package:vacgom_app/auth/model/User.dart';

class TodoItem {
  String title;
  String? memo;
  bool isDone;
  User? user;

  TodoItem(
      {required this.title,
      this.memo,
      this.isDone = false,
      required this.user});
}
