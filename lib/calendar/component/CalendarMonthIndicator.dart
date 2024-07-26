import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CalendarMonthIndicator extends StatelessWidget {
  final String year;
  final String month;

  final Function() onPrevMonth;
  final Function() onNextMonth;

  CalendarMonthIndicator({
    required this.year,
    required this.month,
    required this.onPrevMonth,
    required this.onNextMonth,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            child: SvgPicture.asset(
              "resources/assets/ico/ico-arrow-left.svg",
              width: 20.w,
            ),
            onTap: onPrevMonth,
          ),
          SizedBox(width: 8.w),
          Text(
            '$year.$month',
            style: TextStyle(
              color: Color(0xFF191F28),
              fontSize: 14.sp,
              fontFamily: 'Pretendard',
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            child: SvgPicture.asset(
              "resources/assets/ico/ico-arrow-left.svg",
              width: 20.w,
            ),
            onTap: onNextMonth,
          ),
        ],
      ),
    );
  }
}
