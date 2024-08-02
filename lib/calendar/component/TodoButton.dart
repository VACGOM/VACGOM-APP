import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TodoButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool isActive;

  const TodoButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.isActive})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15.h,
        ),
        margin: EdgeInsets.symmetric(
          horizontal: 10.w,
          vertical: 20.h,
        ),
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF4196FD) : Color(0xFFE5E8EB),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isActive ? Colors.white : Color(0xFF333D4B),
            fontSize: 14.sp,
            fontFamily: 'Pretendard',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
