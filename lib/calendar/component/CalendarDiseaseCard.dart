import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vacgom_app/calendar/component/CalendarVaccineIcon.dart';

class CalendarDiseaseCard extends StatelessWidget {
  CalendarDiseaseCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.h),
      // modified
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Color(0xFFE5E8EB)),
      ),
      child: Column(children: [
        Row(
          children: [
            SvgPicture.asset(
              "resources/assets/ico/ico-vac11.svg",
              width: 50.w,
            ),
            SizedBox(
              width: 10.w,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '사람유두종바이러스',
                  style: TextStyle(
                    color: Color(0xFF333D4B),
                    fontSize: 16,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  '24.12.18 ~25.12.18',
                  style: TextStyle(
                    color: Color(0xFF8B95A1),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                    letterSpacing: -0.30,
                  ),
                )
              ],
            )
          ],
        ),
        Container(
          padding: EdgeInsets.only(top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차"),
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차"),
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차"),
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차"),
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차"),
              CalendarVaccineIcon(type: VaccineType.INOCULATED, title: "1차")
            ],
          ),
        )
      ]),
    );
  }
}
