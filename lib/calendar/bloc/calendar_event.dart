part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

class InitEvent extends CalendarEvent {}

class ChangeMonthEvent extends CalendarEvent {
  final int move;

  ChangeMonthEvent({required this.move});
}

class SelectDayEvent extends CalendarEvent {
  final DateTime date;
  bool isPrev;
  bool isNext;

  SelectDayEvent(
      {required this.date, this.isPrev = false, this.isNext = false});
}

class MarkDoneEvent extends CalendarEvent {
  final VacgomTodoItem todoItem;
  final User user;

  MarkDoneEvent({required this.todoItem, required this.user});
}

class MarkUndoneEvent extends CalendarEvent {
  final VacgomTodoItem todoItem;

  MarkUndoneEvent({required this.todoItem});
}

class TodoAddedEvent extends CalendarEvent {
  final String todo;

  TodoAddedEvent({required this.todo});
}
