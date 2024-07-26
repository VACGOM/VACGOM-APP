import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/calendar/component/CalendarIcon.dart';
import 'package:vacgom_app/calendar/model/CalendarItem.dart';

class TodoCalendarIcon extends CalendarIcon {
  final CalendarItem item;

  TodoCalendarIcon({required this.item}) : super(item: item);

  @override
  Widget build(BuildContext context) {
    int leftTodoCount = item.calendarTodoItem.leftTodoCount;
    bool isFinished = false;

    double firstCompletionRate =
        item.calendarTodoItem.userTodoCompletions.length > 0
            ? item.calendarTodoItem.userTodoCompletions[0].completionRate
            : 0;
    Color firstCompletionColor =
        item.calendarTodoItem.userTodoCompletions.length > 0
            ? item.calendarTodoItem.userTodoCompletions[0].user!.getColor()
            : Color(0xFFE5E8EB);

    double secondCompletionRate =
        item.calendarTodoItem.userTodoCompletions.length > 1
            ? item.calendarTodoItem.userTodoCompletions[1].completionRate
            : 0;
    Color secondCompletionColor =
        item.calendarTodoItem.userTodoCompletions.length > 1
            ? item.calendarTodoItem.userTodoCompletions[1].user!.getColor()
            : Color(0xFFE5E8EB);

    return Container(
      child: Stack(
        children: [
          Container(
              width: 36.w,
              height: 36.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Color(0xFFE5E8EB),
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(60.r),
              ),
              child: Container(
                  alignment: Alignment.center,
                  width: 18.w,
                  child: isFinished
                      ? SvgPicture.asset(
                          "resources/assets/ico/ico-schedule-check.svg",
                          width: 20.w,
                        )
                      : Text(
                          leftTodoCount.toString(),
                          style: TextStyle(
                            color: Color(0xFF8B95A1),
                            fontSize: 14.sp,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w400,
                          ),
                        ))),
          Container(
            width: 36.w,
            height: 36.h,
            padding: EdgeInsets.all(1.4.w),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              value: firstCompletionRate + secondCompletionRate,
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(secondCompletionColor),
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
          Container(
            width: 36.w,
            height: 36.h,
            padding: EdgeInsets.all(1.4.w),
            alignment: Alignment.center,
            child: CircularProgressIndicator(
              value: firstCompletionRate,
              strokeWidth: 2.w,
              valueColor: AlwaysStoppedAnimation<Color>(firstCompletionColor),
              semanticsLabel: 'Linear progress indicator',
            ),
          ),
        ],
      ),
    );
  }
}
