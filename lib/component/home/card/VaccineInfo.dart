import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

class NotYetVaccine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        child: Row(
          children: [
            SvgPicture.asset(
              "resources/assets/ico/ico-vac4.svg",
              height: 30.h,
            ),
            SizedBox(width: 15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '취약 질병',
                    style: TextStyle(
                      color: Color(0xFF8B95A1),
                      fontSize: 14.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      Text(
                        '${context.read<AuthBloc>().state.user!.babyName}의 아직 맞지 않은 백신',
                        style: TextStyle(
                          color: Color(0xFF191F28),
                          fontSize: 16.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            GestureDetector(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 12.w,
                  vertical: 8.h,
                ),
                decoration: ShapeDecoration(
                  color: Color(0xFFF2F4F6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.w)),
                ),
                alignment: Alignment.center,
                child: Text(
                  "조회",
                  style: TextStyle(
                    color: Color(0xFF8B95A1),
                    fontSize: 14,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
