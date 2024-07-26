import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:vacgom_app/calendar/model/CalendarTodoItem.dart';
import 'package:vacgom_app/calendar/model/TodoCompletion.dart';
import 'package:vacgom_app/calendar/service/CalendarService.dart';

import '../model/CalendarGroup.dart';
import '../model/CalendarItem.dart';

part 'calendar_event.dart';
part 'calendar_state.dart';

class CalendarBloc extends Bloc<CalendarEvent, CalendarState> {
  Future<CalendarGroup> generate(DateTime dateTime) async  {

    CalendarService calendarService = CalendarService();
    Map<String, CalendarTodoItem> calendarTodoMap = await calendarService.searchTodo(
        dateTime.year, dateTime.month);

    print(calendarTodoMap);
    List<List<CalendarItem>> calendarItems = [];

    int dayOfWeek = (dateTime.weekday % 7);
    int prevMonthDays = dayOfWeek;

    List<CalendarItem> prevMonthItems = [];
    DateTime dateTimeIndex = dateTime.subtract(Duration(days: prevMonthDays));
    //이전 달의 날짜들
    for (int i = 0; i < prevMonthDays; i++) {
      prevMonthItems.add(CalendarItem(
          date: dateTimeIndex,
          calendarTodoItem: CalendarTodoItem(userTodoCompletions: [], unassignedTodoCompletion: TodoCompletion())));
      dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
    }

    //이번 달인데 첫번째 주
    for (int i = 0; i < 7 - prevMonthDays; i++) {
      prevMonthItems.add(CalendarItem(
          date: dateTimeIndex,
          calendarTodoItem: CalendarTodoItem(userTodoCompletions: [], unassignedTodoCompletion: TodoCompletion())));
      dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
    }

    calendarItems.add(prevMonthItems);

    for (int i = 0; i < 4; i++) {
      List<CalendarItem> weekItems = [];
      for (int j = 0; j < 7; j++) {
        print(dateTimeIndex.toIso8601String().split("T")[0]);
        weekItems.add(CalendarItem(
            date: dateTimeIndex,
            calendarTodoItem: calendarTodoMap[dateTimeIndex.toIso8601String().split("T")[0]] ??
                CalendarTodoItem(userTodoCompletions: [], unassignedTodoCompletion: TodoCompletion())));
        dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
      }
      calendarItems.add(weekItems);
    }

    print(calendarItems);

    return CalendarGroup(calendarItems: calendarItems);
  }

  CalendarBloc() : super(CalendarInitial()) {
    on<InitEvent>((event, emit) async {
      print("InitEvent");
      emit(CalendarState(
          DateTime.now(), await generate(DateTime.now().copyWith(day: 1))));
    });

    on<ChangeMonthEvent>((event, emit) async {
      DateTime newDateTime = state.datetime
          .copyWith(month: state.datetime.month + event.move, day: 1);

      emit(CalendarState(newDateTime, await generate(newDateTime)));
    });

    on<SelectDayEvent>((event, emit) {
      DateTime newDateTime = state.datetime.copyWith(
        day: event.day,
      );
      emit(CalendarState(newDateTime, state.calendarGroup));
    });
  }
}
