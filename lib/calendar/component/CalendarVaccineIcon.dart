import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum VaccineType { INOCULATED, NON_INOCULATED, BLANK }

class CalendarVaccineIcon extends StatelessWidget {
  final VaccineType type;
  final String title;

  CalendarVaccineIcon({required this.type, required this.title});

  @override
  Widget build(BuildContext context) {
    final inoculated = Column(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset("resources/assets/ico/Star 3.svg"),
            SvgPicture.asset("resources/assets/ico/syringe1.svg"),
          ]),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF4196FD),
            fontSize: 15.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final nonInoculated = Column(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              "resources/assets/ico/Star 3.svg",
              colorFilter: ColorFilter.mode(Color(0xFFF2F4F6), BlendMode.srcIn),
            ),
            SvgPicture.asset(
              "resources/assets/ico/syringe1.svg",
              colorFilter: ColorFilter.mode(Color(0xFFB0B8C1), BlendMode.srcIn),
            ),
          ]),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6B7684),
            fontSize: 15.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    final blank = Column(
      children: [
        Container(
          width: 50.w,
          height: 50.h,
          alignment: Alignment.center,
          child: Stack(alignment: Alignment.center, children: [
            SvgPicture.asset(
              "resources/assets/ico/Star 3.svg",
              colorFilter: ColorFilter.mode(Color(0xFFF2F4F6), BlendMode.srcIn),
            ),
            SvgPicture.asset(
              "resources/assets/ico/syringe1.svg",
              colorFilter: ColorFilter.mode(Color(0xFFF2F4F6), BlendMode.srcIn),
            ),
          ]),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xFF6B7684),
            fontSize: 15.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        )
      ],
    );

    if (type == VaccineType.INOCULATED) {
      return inoculated;
    } else if (type == VaccineType.NON_INOCULATED) {
      return nonInoculated;
    } else {
      return blank;
    }
  }
}
