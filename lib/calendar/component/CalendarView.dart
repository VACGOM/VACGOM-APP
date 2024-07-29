import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/component/MultiCalendarIcon.dart';
import 'package:vacgom_app/calendar/model/CalendarGroup.dart';

import '../bloc/calendar_bloc.dart';

class CalendarView extends StatelessWidget {
  final CalendarGroup calendarGroup;

  CalendarView({required this.calendarGroup});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
          children: calendarGroup.calendarItems.map((week) {
        return Container(
          padding: EdgeInsets.only(bottom: 8.h),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: week.map((e) {
                return GestureDetector(
                    onTap: () {
                      context
                          .read<CalendarBloc>()
                          .add(SelectDayEvent(date: e.date));
                    },
                    child: MultiCalendarIcon(item: e));
              }).toList()),
        );
      }).toList()),
    );
  }
}
