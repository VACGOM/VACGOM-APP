import 'package:vacgom_app/calendar/model/CalendarGroupEntry.dart';

class CalendarGroup {
  List<List<CalendarGroupEntry>> calendarGroup = [];

  static CalendarGroup create(DateTime dateTime) {
    List<List<CalendarGroupEntry>> calendarItems = [];

    int dayOfWeek = (dateTime.weekday % 7);
    int prevMonthDays = dayOfWeek;

    List<CalendarGroupEntry> prevMonthItems = [];
    DateTime dateTimeIndex = dateTime.subtract(Duration(days: prevMonthDays));

    //이전 달의 날짜들
    for (int i = 0; i < prevMonthDays; i++) {
      prevMonthItems.add(CalendarGroupEntry(
          date: dateTimeIndex,
          isPreviousMonth: true,
          isNextMonth: false,
          text: dateTimeIndex.day.toString()));
      dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
    }

    //이번 달인데 첫번째 주
    for (int i = 0; i < 7 - prevMonthDays; i++) {
      prevMonthItems.add(CalendarGroupEntry(
          date: dateTimeIndex,
          isPreviousMonth: false,
          isNextMonth: false,
          text: dateTimeIndex.day.toString()));
      dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
    }

    calendarItems.add(prevMonthItems);

    for (int i = 0; i < 4; i++) {
      List<CalendarGroupEntry> weekItems = [];
      for (int j = 0; j < 7; j++) {
        print(dateTimeIndex.toIso8601String().split("T")[0]);
        weekItems.add(CalendarGroupEntry(
            date: dateTimeIndex,
            isPreviousMonth: false,
            isNextMonth: false,
            text: dateTimeIndex.day.toString()));
        dateTimeIndex = dateTimeIndex.add(Duration(days: 1));
      }
      calendarItems.add(weekItems);
    }

    return CalendarGroup()..calendarGroup = calendarItems;
  }
}
