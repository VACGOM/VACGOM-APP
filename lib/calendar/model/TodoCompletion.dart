import '../../auth/model/User.dart';
import 'TodoItem.dart';

class TodoCompletion {
  User? user;
  List<TodoItem> todoItems = [];
  double completionRate;

  TodoCompletion(
      {this.user, this.todoItems = const [], this.completionRate = 0.0});
}
