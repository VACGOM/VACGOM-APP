import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/component/MultiCalendarIcon.dart';
import 'package:vacgom_app/calendar/model/CalendarGroup.dart';
import 'package:vacgom_app/calendar/model/VacgomTodoMonthly.dart';

import '../bloc/calendar_bloc.dart';

class CalendarView extends StatelessWidget {
  final CalendarGroup calendarGroup;
  final VacgomTodoMonthly vacgomTodoMonthly;

  CalendarView({required this.calendarGroup, required this.vacgomTodoMonthly});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
          children: calendarGroup.calendarGroup.map((week) {
        return Container(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: week.map((e) {
                return GestureDetector(
                    onTap: () {
                      context.read<CalendarBloc>().add(SelectDayEvent(
                          date: e.date,
                          isPrev: e.isPreviousMonth,
                          isNext: e.isNextMonth));
                    },
                    child: MultiCalendarIcon(
                        isSelected: e.date ==
                            context.read<CalendarBloc>().state.datetime,
                        item: vacgomTodoMonthly.getDay(e.date)));
              }).toList()),
        );
      }).toList()),
    );
  }
}
