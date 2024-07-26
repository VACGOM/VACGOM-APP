import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Vacbutton extends StatelessWidget {
  String text;
  bool isPrimary;
  Function onPressed;

  Vacbutton(
      {required this.text, required this.isPrimary, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            vertical: 18.h,
          ),
          margin: EdgeInsets.symmetric(
            horizontal: 20.w,
          ),
          decoration: isPrimary
              ? ShapeDecoration(
                  color: Color(0xFF4196FD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                )
              : BoxDecoration(
                  border: Border.all(
                    color: Color(0xFFE5E8EB),
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
          child: Container(
            alignment: Alignment.center,
            child: Text(
              text,
              style: TextStyle(
                color: isPrimary ? Colors.white : Color(0xFF4E5968),
                fontSize: 16.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
                letterSpacing: -0.30,
              ),
            ),
          )),
    );
  }
}
