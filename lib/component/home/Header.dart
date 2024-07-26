import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Header extends StatelessWidget {
  final String title;

  Header({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 15.h),
        margin: EdgeInsets.only(bottom: 15),
        child: Text(
          title,
          style: TextStyle(
            color: Color(0xFF333D4B),
            fontSize: 20.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w700,
            height: 0.06,
          ),
        ));
  }
}
