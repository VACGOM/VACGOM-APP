import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/calendar/component/CalendarIcon.dart';
import 'package:vacgom_app/calendar/model/VacgomTodoDay.dart';

class TodoCalendarIcon extends CalendarIcon {
  final VacgomTodoDay item;

  TodoCalendarIcon({required this.item}) : super(item: item);

  @override
  Widget build(BuildContext context) {
    int leftTodoCount = item.getTodoItems().length;
    bool isFinished = item.getTodoItems().isEmpty;

    double completionRateSum = 0;
    List<Widget> completionList = item.getTodoCompletion().map((e) {
      completionRateSum += e.completionRate;
      return Container(
        width: 36.w,
        height: 36.h,
        padding: EdgeInsets.all(1.4.w),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          value: completionRateSum,
          strokeWidth: 2.w,
          valueColor: AlwaysStoppedAnimation<Color>(
              context.read<AuthBloc>().state.user?.id == e.userId &&
                      context.read<AuthBloc>().state.user!.isMaster
                  ? Color(0xFF4196FD)
                  : Color(0xFF85D27F)),
          semanticsLabel: 'Linear progress indicator',
        ),
      );
    }).toList();

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
          ...completionList
        ],
      ),
    );
  }
}
