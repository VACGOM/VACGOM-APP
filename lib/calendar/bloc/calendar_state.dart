part of 'calendar_bloc.dart';

class CalendarState {
  DateTime datetime;
  CalendarGroup calendarGroup;
  VacgomTodoMap todoMap;

  CalendarState(this.datetime, this.calendarGroup, this.todoMap);
}

class CalendarInitial extends CalendarState {
  CalendarInitial()
      : super(DateTime.now(), CalendarGroup(), VacgomTodoMap(todoItems: {}));
}
