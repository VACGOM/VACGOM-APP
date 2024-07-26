import 'package:vacgom_app/calendar/model/CalendarTodoItem.dart';

class CalendarItem {
  final DateTime date;
  CalendarTodoItem calendarTodoItem;

  CalendarItem({required this.date, required this.calendarTodoItem});

  List<double> getCompletionRates() {
    List<double> completionRates = [];
    for (var todoCompletion in calendarTodoItem.userTodoCompletions) {
      completionRates.add(todoCompletion.completionRate);
    }
    return completionRates;
  }
}
