import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/bottomsheet/bottom_sheet_bloc.dart';
import 'package:vacgom_app/calendar/component/TodoButton.dart';
import 'package:vacgom_app/calendar/component/TodoItemElement.dart';
import 'package:vacgom_app/component/Input.dart';

import '../../scaffold.dart';
import '../model/VacgomTodoItem.dart';

class NewTodoList extends StatelessWidget {
  final List<VacgomTodoItem> todoItems;
  final int percent;

  NewTodoList({required this.todoItems, required this.percent});

  @override
  Widget build(BuildContext context) {
    print(todoItems);
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE5E8EB)),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                SvgPicture.asset(
                  "resources/assets/ico/pinned-filled.svg",
                  width: 24.w,
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "해야할 일",
                  style: TextStyle(
                    color: Color(0xFF333D4B),
                    fontSize: 17,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  "${percent}% 달성",
                  style: TextStyle(
                    color: Color(0xFF4196FD),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                )
              ]),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(
                      context:
                          ScaffoldWith.navigatorKey.currentContext ?? context,
                      builder: (context) {
                        return Container(
                          color: Colors.transparent,
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              horizontal: 10.w, vertical: 30.h),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20)),
                            width: double.infinity,
                            padding: EdgeInsets.only(top: 20.w),
                            child: Wrap(
                              children: [
                                Center(
                                  child: Container(
                                    alignment: Alignment.center,
                                    width: 60.w,
                                    height: 5.h,
                                    margin: EdgeInsets.only(bottom: 15.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xFFD9D9D9),
                                    ),
                                  ),
                                ),
                                Input("할 일 등록", "내용 입력", (p0) {
                                  context
                                      .read<BottomSheetBloc>()
                                      .add(BottomSheetInputChanged(p0));
                                }),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 20.h,
                                    horizontal: 10.w,
                                  ),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: TodoButton(
                                            text: "취소",
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            isActive: false),
                                      ),
                                      Expanded(
                                        child: TodoButton(
                                            text: "등록",
                                            onPressed: () {
                                              context
                                                  .read<CalendarBloc>()
                                                  .add(TodoAddedEvent(
                                                    todo: context
                                                        .read<BottomSheetBloc>()
                                                        .state
                                                        .input,
                                                  ));
                                              Navigator.pop(context);
                                            },
                                            isActive: true),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      });
                },
                child: SvgPicture.asset("resources/assets/ico/plus.svg"),
              )
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          todoItems.isEmpty
              ? Container(
                  padding: EdgeInsets.symmetric(vertical: 15.h),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "resources/assets/ico/Search.svg",
                        width: 64.w,
                      ),
                      SizedBox(
                        height: 14.h,
                      ),
                      Text(
                        "등록된 TODO가 없어요",
                        style: TextStyle(
                          color: Color(0xFF8B95A1),
                          fontSize: 14,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      )
                    ],
                  ))
              : Column(
                  children: todoItems
                      .map((e) => TodoItemElement(
                          title: e.title,
                          isDone: e.isDone,
                          hasMemo: e.memo != null,
                          color: Colors.transparent,
                          toggleDone: (b) {
                            context.read<CalendarBloc>().add(MarkDoneEvent(
                                todoItem: e,
                                user: context.read<AuthBloc>().state.user!));
                          }))
                      .toList(),
                ),
        ],
      ),
    );
  }
}
