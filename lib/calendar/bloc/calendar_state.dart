part of 'calendar_bloc.dart';

class CalendarState {
  DateTime datetime;
  CalendarGroup calendarGroup;

  CalendarState(this.datetime, this.calendarGroup);
}

class CalendarInitial extends CalendarState {
  CalendarInitial() : super(DateTime.now(), CalendarGroup(calendarItems: []));
}
