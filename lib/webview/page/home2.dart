import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Home2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Color(0xFFF9FAFB),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: LoadingAnimationWidget.prograssiveDots(
                  color: Color(0xFF4196FD), size: 40),
            ),
          )),
    );
  }
}
