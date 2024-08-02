import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TodoItemElement extends StatelessWidget {
  final String title;
  final bool isDone;
  final bool hasMemo;
  final Color color;
  final Function(bool) toggleDone;

  TodoItemElement(
      {required this.title,
      required this.isDone,
      required this.hasMemo,
      required this.color,
      required this.toggleDone});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(
          vertical: 12.h,
        ),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                toggleDone(!isDone);
              },
              child: isDone
                  ? SvgPicture.asset("resources/assets/ico/Subtract.svg",
                      width: 24.w,
                      colorFilter: ColorFilter.mode(color, BlendMode.srcIn))
                  : SvgPicture.asset(
                      "resources/assets/ico/ico-choice-unselec.svg",
                      width: 24.w,
                    ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Color(0xFF191F28),
                    fontSize: 15.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                if (hasMemo)
                  Row(
                    children: [
                      Text(
                        "메모",
                        style: TextStyle(
                          color: Color(0xFF8B95A1),
                          fontSize: 12.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )
              ],
            )
          ],
        ));
  }
}
