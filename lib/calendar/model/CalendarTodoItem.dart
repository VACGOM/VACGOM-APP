import 'TodoCompletion.dart';

class CalendarTodoItem {
  List<TodoCompletion> userTodoCompletions;
  TodoCompletion unassignedTodoCompletion = TodoCompletion();

  CalendarTodoItem(
      {required this.userTodoCompletions,
      required this.unassignedTodoCompletion});

  int get leftTodoCount {
    int count = 0;

    for (TodoCompletion completion in userTodoCompletions) {
      completion.todoItems.forEach((element) {
        if (!element.isDone) {
          count++;
        }
      });
    }

    unassignedTodoCompletion.todoItems.forEach((element) {
      if (!element.isDone) {
        count++;
      }
    });

    return count;
  }
}
