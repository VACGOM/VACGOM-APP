part of 'calendar_bloc.dart';

@immutable
sealed class CalendarEvent {}

class InitEvent extends CalendarEvent {}

class ChangeMonthEvent extends CalendarEvent {
  final int move;

  ChangeMonthEvent({required this.move});
}

class SelectDayEvent extends CalendarEvent {
  final int day;

  SelectDayEvent({required this.day});
}
