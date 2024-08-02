import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/component/CalendarDayItem.dart';
import 'package:vacgom_app/calendar/component/CalendarHeader.dart';
import 'package:vacgom_app/calendar/component/CalendarView.dart';
import 'package:vacgom_app/calendar/component/NewTodoList.dart';
import 'package:vacgom_app/calendar/component/UserTodoList.dart';
import 'package:vacgom_app/component/home/Header.dart';

class CalendarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Container(
            child: Column(children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFFF2F4F6),
                    ),
                  ),
                ),
                child: Column(children: [
                  Header(title: "달력"),
                  CalendarHeader(),
                ]),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.h, horizontal: 20.w),
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
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Column(
                              children: [
                                CalendarView(
                                    vacgomTodoMonthly:
                                        state.todoMap.toMonthly(state.datetime),
                                    calendarGroup: state.calendarGroup),
                              ],
                            ),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(20.r),
                        decoration: BoxDecoration(
                          color: Color(0xFFF9FAFB),
                          border: Border(
                            top: BorderSide(
                              color: Color(0xFFE5E8EB),
                            ),
                          ),
                        ),
                        child: Column(
                          children: [
                            BlocBuilder<CalendarBloc, CalendarState>(
                              builder: (context, state) {
                                return Column(
                                  children: [
                                    NewTodoList(
                                        percent: state.todoMap
                                            .toMonthly(state.datetime)
                                            .getDay(state.datetime)
                                            .getCompletionRate(),
                                        todoItems: state.todoMap
                                            .toMonthly(state.datetime)
                                            .getDay(state.datetime)
                                            .getTodoItems()),
                                    state.todoMap
                                            .toMonthly(state.datetime)
                                            .getDay(state.datetime)
                                            .todoItems
                                            .isNotEmpty
                                        ? UserTodoList(
                                            todoMap: state.todoMap
                                                .toMonthly(state.datetime)
                                                .getDay(state.datetime),
                                            user: context
                                                .read<AuthBloc>()
                                                .state
                                                .user!)
                                        : Container()
                                  ],
                                );
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]),
          ),
        ));
  }
}
