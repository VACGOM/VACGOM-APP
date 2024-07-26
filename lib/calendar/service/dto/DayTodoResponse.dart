import 'package:vacgom_app/calendar/service/dto/TodoResponse.dart';

class DayTodoResponse {
  DateTime date;
  List<TodoResponse> todoResponses;

  DayTodoResponse({required this.date, required this.todoResponses});
}
