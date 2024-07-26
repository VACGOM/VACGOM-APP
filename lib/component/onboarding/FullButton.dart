import 'package:flutter/cupertino.dart';

class FullButton extends StatelessWidget {
  String text;
  Function() onPressed;
  bool isActive;

  FullButton(
      {required this.text, required this.onPressed, required this.isActive}) {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: isActive ? Color(0xFF4196FD) : Color(0xFFE5E8EB),
        ),
        child: SafeArea(
          top: false,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 16, horizontal: 20),
            child: Text(text,
                style: TextStyle(
                  color: isActive ? Color(0xFFFFFFFF) : Color(0xFF8B95A1),
                  fontSize: 16,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.center),
          ),
        ),
      ),
    );
  }
}
