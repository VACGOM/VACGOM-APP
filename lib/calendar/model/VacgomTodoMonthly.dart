import 'package:vacgom_app/calendar/model/VacgomTodoDay.dart';

import 'VacgomTodoItem.dart';

class VacgomTodoMonthly {
  final DateTime date;
  final List<VacgomTodoItem> todoDays;

  VacgomTodoMonthly({required this.date, required this.todoDays});

  VacgomTodoDay getDay(DateTime dateTime) {
    List<VacgomTodoItem> dailyTodoItems = [];

    todoDays.forEach((element) {
      if (element.date.year == dateTime.year &&
          element.date.month == dateTime.month &&
          element.date.day == dateTime.day) {
        dailyTodoItems.add(element);
      }
    });

    return VacgomTodoDay(date: dateTime, todoItems: dailyTodoItems);
  }
}
