import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';

class ChildProfileCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(left: 20.h, top: 15.w, bottom: 15.w, right: 50.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Color(0xFFE5E8EB),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Container(
              width: 60.w,
              height: 60.h,
              alignment: Alignment.center,
              color: Color(0xFFF2F4F6),
              child: SvgPicture.asset(
                "resources/assets/ico/Group.svg",
                width: 33.3.w,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                children: [
                  Text(
                    context.read<AuthBloc>().state.user?.babyName ?? '아기',
                    style: TextStyle(
                      color: Color(0xFF333D4B),
                      fontSize: 20.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    '공주님',
                    style: TextStyle(
                      color: Color(0xFF4196FD),
                      fontSize: 14.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w600,
                    ),
                  )
                ],
              ),
              Text(
                '태어난지 180일째',
                style: TextStyle(
                  color: Color(0xFF8B95A1),
                  fontSize: 14.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  letterSpacing: -0.30,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
