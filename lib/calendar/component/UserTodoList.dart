import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/calendar/bloc/calendar_bloc.dart';
import 'package:vacgom_app/calendar/component/TodoItemElement.dart';
import 'package:vacgom_app/calendar/model/VacgomTodoDay.dart';

import '../../auth/model/User.dart';

class UserTodoList extends StatelessWidget {
  final User user;
  final VacgomTodoDay todoMap;

  UserTodoList({required this.user, required this.todoMap});

  @override
  Widget build(BuildContext context) {
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
                SizedBox(
                  width: 8.w,
                ),
                Text(
                  user.name!,
                  style: TextStyle(
                    color: Color(0xFF333D4B),
                    fontSize: 17,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                )
              ]),
            ],
          ),
          SizedBox(
            height: 10.h,
          ),
          Column(
            children: todoMap
                .getByUserId(user.id)
                .map((todoItem) => TodoItemElement(
                    title: todoItem.title,
                    isDone: todoItem.isDone,
                    hasMemo: todoItem.memo != null,
                    color: user.getColor(),
                    toggleDone: (t) {
                      context
                          .read<CalendarBloc>()
                          .add(MarkUndoneEvent(todoItem: todoItem));
                    }))
                .toList(),
          ),
        ],
      ),
    );
  }
}
