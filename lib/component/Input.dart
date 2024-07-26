import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Input extends StatelessWidget {
  final String label;
  final String placeholder;
  final Function(String) onChanged;

  Input(this.label, this.placeholder, this.onChanged);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 14.h, horizontal: 20.w),
      child: TextFieldTapRegion(
        onTapOutside: (e) {
          FocusScope.of(context).unfocus();
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: TextStyle(
                color: Color(0xFF333D4B),
                fontSize: 14.sp,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
                padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 3.h),
                decoration: ShapeDecoration(
                  color: Color(0xFFF9FAFB),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFFE5E8EB)),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: TextField(
                  onChanged: onChanged,
                  style: TextStyle(
                    color: Color(0xFF8B95A1),
                    fontSize: 16.sp,
                    fontFamily: 'Pretendard',
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    hintText: placeholder,
                    hintStyle: TextStyle(
                      color: Color(0xFF8B95A1),
                      fontSize: 16.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w400,
                    ),
                    border: InputBorder.none,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
