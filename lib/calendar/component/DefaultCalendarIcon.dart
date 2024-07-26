import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/calendar/component/CalendarIcon.dart';
import 'package:vacgom_app/calendar/model/CalendarItem.dart';

class DefaultCalendarIcon extends CalendarIcon {
  final CalendarItem item;

  DefaultCalendarIcon({required this.item}) : super(item: item);

  @override
  Widget build(BuildContext context) {
    return Container(
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
          width: 18.w,
          child: SvgPicture.asset(
            "resources/assets/ico/vac-cal.svg",
          ),
        ));
  }
}
