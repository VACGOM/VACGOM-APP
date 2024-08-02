import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/calendar/component/TodoItemElement.dart';
import 'package:vacgom_app/calendar/model/VacgomTodoItem.dart';

import '../../../auth/auth_bloc.dart';
import '../../../calendar/bloc/calendar_bloc.dart';

class TodoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final today = context
        .read<CalendarBloc>()
        .state
        .todoMap
        .toMonthly(DateTime.now())
        .getDay(DateTime.now());
    return Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20.w,
          vertical: 15.h,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Color(0xFFE5E8EB),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
                  child: Row(
                    children: [
                      Text(
                        '오늘 해야할 일',
                        style: TextStyle(
                          color: Color(0xFF333D4B),
                          fontSize: 16,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 10.w),
                      BlocBuilder<CalendarBloc, CalendarState>(
                          builder: (context, state) {
                        final today = state.todoMap
                            .toMonthly(DateTime.now())
                            .getDay(DateTime.now());
                        return Text(
                          '${today.getCompletionRate()}% 달성',
                          style: TextStyle(
                            color: Color(0xFF4196FD),
                            fontSize: 14,
                            fontFamily: 'Pretendard',
                            fontWeight: FontWeight.w500,
                            letterSpacing: -0.30,
                          ),
                        );
                      }),
                    ],
                  ),
                ),
                BlocBuilder<CalendarBloc, CalendarState>(
                  builder: (context, state) {
                    List<VacgomTodoItem> items = [];
                    final today = state.todoMap
                        .toMonthly(DateTime.now())
                        .getDay(DateTime.now());

                    today.getTodoItems().forEach((element) {
                      items.add(element);
                    });

                    today.todoItems.forEach((element) {
                      if (element.memberId != null) {
                        items.add(element);
                      }
                    });

                    if (items.isEmpty)
                      return Container(
                        width: double.infinity,
                        padding: EdgeInsets.symmetric(vertical: 20.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset("resources/assets/ico/Search.svg"),
                            SizedBox(height: 10.h),
                            Text(
                              '오늘 할 일이 없어요!',
                              style: TextStyle(
                                color: Color(0xFF8B95A1),
                                fontSize: 14,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      );
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: items
                          .map((e) => Row(children: [
                                TodoItemElement(
                                    title: e.title,
                                    isDone: e.isDone,
                                    hasMemo: e.memo != null,
                                    color: Colors.black12,
                                    toggleDone: (b) {
                                      if (b) {
                                        context.read<CalendarBloc>().add(
                                            MarkDoneEvent(
                                                todoItem: e,
                                                user: context
                                                    .read<AuthBloc>()
                                                    .state
                                                    .user!));
                                      } else {
                                        context
                                            .read<CalendarBloc>()
                                            .add(MarkUndoneEvent(todoItem: e));
                                      }
                                    })
                              ]))
                          .toList(),
                    );
                  },
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFE5E8EB),
                    width: 1,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 15.h, bottom: 5.h),
              alignment: Alignment.center,
              child: GestureDetector(
                onTap: () {
                  GoRouter.of(context).push("/calendar");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "더보기",
                      style: TextStyle(
                        color: Color(0xFF4E5968),
                        fontSize: 14,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(width: 5.w),
                    SvgPicture.asset("resources/assets/ico/ico-arrow-right.svg")
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
