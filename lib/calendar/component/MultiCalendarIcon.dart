import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/component/CalendarIcon.dart';
import 'package:vacgom_app/calendar/component/DefaultCalendarIcon.dart';
import 'package:vacgom_app/calendar/component/TodoCalendarIcon.dart';
import 'package:vacgom_app/calendar/model/CalendarItem.dart';

import '../bloc/calendar_bloc.dart';

class MultiCalendarIcon extends CalendarIcon {
  final CalendarItem item;

  bool isToday() {
    DateTime now = DateTime.now();
    return now.year == item.date.year &&
        now.month == item.date.month &&
        now.day == item.date.day;
  }

  MultiCalendarIcon({required this.item}) : super(item: item);

  @override
  Widget build(BuildContext context) {
    bool isSelected = item.date == context.read<CalendarBloc>().state.datetime;
    Widget icon = item.calendarTodoItem.leftTodoCount > 0
        ? TodoCalendarIcon(item: item)
        : DefaultCalendarIcon(item: item);
    return Container(
        width: 50.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: 24.w,
              height: 24.w,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isToday()
                    ? Color(0xFF333D4B)
                    : isSelected
                        ? Color(0xFFF2F4F6)
                        : Colors.transparent,
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Text(
                item.date.day.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: isToday() ? Colors.white : Color(0xFF4E5968),
                  fontSize: 12.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ));
  }
}
