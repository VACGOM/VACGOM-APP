import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class KakaoButton extends StatelessWidget {
  Function() onPressed;

  KakaoButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      pressedOpacity: 0.9,
      onPressed: onPressed,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: ShapeDecoration(
          color: Color(0xFFFBE400),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "resources/assets/ico/ico-kakao.svg",
              width: 20,
            ),
            SizedBox(width: 10), // SizedBox(
            Text(
              "카카오로 계속하기",
              style: TextStyle(
                color: Color(0xFF3E1A1D),
                fontSize: 16,
                fontFamily: 'Pretendard',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
