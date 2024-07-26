import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/component/CalendarDayItem.dart';
import 'package:vacgom_app/calendar/component/CalendarHeader.dart';
import 'package:vacgom_app/calendar/component/CalendarView.dart';
import 'package:vacgom_app/component/home/Header.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Color(0xFFF9FAFB),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(children: [
              Header(title: "달력"),
              Container(
                  child: Column(
                children: [
                  CalendarHeader(),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CalendarDayItem(day: "일", isWeekend: true),
                        CalendarDayItem(day: "월", isWeekend: false),
                        CalendarDayItem(day: "화", isWeekend: false),
                        CalendarDayItem(day: "수", isWeekend: false),
                        CalendarDayItem(day: "목", isWeekend: false),
                        CalendarDayItem(day: "금", isWeekend: false),
                        CalendarDayItem(day: "토", isWeekend: true),
                      ],
                    ),
                  ),
                  BlocBuilder<CalendarBloc, CalendarState>(
                    builder: (context, state) {
                      return CalendarView(calendarGroup: state.calendarGroup);
                    },
                  )
                ],
              ))
            ]),
          )),
    );
  }
}
