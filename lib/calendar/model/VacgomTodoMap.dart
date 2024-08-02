import 'package:vacgom_app/calendar/model/VacgomTodoMonthly.dart';
import 'VacgomTodoItem.dart';

class VacgomTodoMap {
  Map<int, VacgomTodoItem> todoItems;

  VacgomTodoMap({required this.todoItems});

  VacgomTodoMonthly toMonthly(DateTime dateTime) {
    List<VacgomTodoItem> monthlyTodoItems = [];

    todoItems.forEach((key, value) {
      if (value.date.year == dateTime.year &&
          value.date.month == dateTime.month) {
        monthlyTodoItems.add(value);
      }
    });

    return VacgomTodoMonthly(
        date: DateTime(dateTime.year, dateTime.month, 1),
        todoDays: monthlyTodoItems);
  }
}
