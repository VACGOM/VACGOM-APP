import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/component/home/Header.dart';
import 'package:vacgom_app/component/home/card/ChildProfileCard.dart';
import 'package:vacgom_app/component/home/card/VaccineInfoCard.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';

import '../../component/home/card/InfoCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Color(0xFFF9FAFB),
          body: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              Header(title: "홈"),
              Container(
                height: 167,
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(child: ChildProfileCard()),
                    SizedBox(width: 5.w),
                    Expanded(
                      child: Column(
                        children: [
                          InfoCard(),
                          SizedBox(height: 5.h),
                          VaccineInfoCard(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ]),
          )),
    );
  }
}
