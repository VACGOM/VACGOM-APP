import 'package:vacgom_app/calendar/model/TodoCompletion.dart';

import 'VacgomTodoItem.dart';

class VacgomTodoDay {
  final DateTime date;
  final List<VacgomTodoItem> todoItems;

  VacgomTodoDay({required this.date, required this.todoItems});

  List<VacgomTodoItem> getByUserId(int userId) {
    return todoItems
        .map((e) {
          if (e.memberId == userId)
            return e;
          else
            return null;
        })
        .nonNulls
        .toList();
  }

  int getCompletionRate() {
    double tot = 0;
    final todoCompletion = getTodoCompletion();
    todoCompletion.forEach((element) {
      tot += element.completionRate;
    });
    return (tot * 100).toInt();
  }

  List<TodoCompletion> getTodoCompletion() {
    final allTodoCount = todoItems.length;
    final userSet = todoItems.map((e) => e.memberId).nonNulls.toSet();

    if (userSet == null) {
      return [];
    }
    final completionList = userSet.map((userId) {
      final userTodoItems = getByUserId(userId!);
      final doneTodoCount =
          userTodoItems.where((element) => element.isDone).length;
      return TodoCompletion(
        userId: userId,
        completionRate: doneTodoCount / allTodoCount,
      );
    }).toList();

    return completionList;
  }

  List<VacgomTodoItem> getTodoItems() {
    return todoItems
        .map((e) {
          if (e.isDone == false)
            return e;
          else
            return null;
        })
        .nonNulls
        .toList();
  }
}
