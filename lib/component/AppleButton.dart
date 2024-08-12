import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AppleButton extends StatelessWidget {
  Function() onPressed;

  AppleButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 27.w),
      child: SignInWithAppleButton(
        height: 50.h,
        text: 'Apple로 계속하기',
        style: SignInWithAppleButtonStyle.black,
        borderRadius: BorderRadius.circular(12),
        onPressed: onPressed,
      ),
    );
  }
}
