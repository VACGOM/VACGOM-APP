import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CalendarDayItem extends StatelessWidget {
  String day;
  bool isWeekend;

  CalendarDayItem({required this.day, required this.isWeekend});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50.w,
      alignment: Alignment.center,
      child: Text(
        day,
        style: TextStyle(
          color: isWeekend ? Color(0xFFB0B8C1) : Color(0xFF4E5968),
          fontSize: 14.sp,
          fontFamily: 'Pretendard',
          fontWeight: FontWeight.w600,
          letterSpacing: -0.30,
        ),
      ),
    );
  }
}
