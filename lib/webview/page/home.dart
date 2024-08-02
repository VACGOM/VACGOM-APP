import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vacgom_app/component/home/Header.dart';
import 'package:vacgom_app/component/home/card/ChildProfileCard.dart';
import 'package:vacgom_app/component/home/card/NotYetVaccine.dart';
import 'package:vacgom_app/component/home/card/TodoCard.dart';
import 'package:vacgom_app/component/home/card/VaccineInfoCard.dart';
import 'package:vacgom_app/webview/page/main/main_bloc.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';

import '../../component/home/card/InfoCard.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    context.read<MainBloc>().add(MainStarted());
    return SafeArea(
      bottom: false,
      child: Scaffold(
          backgroundColor: Color(0xFFF9FAFB),
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 25),
            child: Column(children: [
              Header(title: "홈"),
              Container(
                height: 167.h,
                child: Flex(
                  direction: Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ChildProfileCard(),
                    SizedBox(width: 8.h),
                    Expanded(
                      child: Column(
                        children: [
                          InfoCard(),
                          SizedBox(height: 5.h),
                          GestureDetector(
                              onTap: () {
                                context.read<WebViewRouteBloc>().add(
                                    WebviewNavigate(
                                        url:
                                            "https://2024-jeju-vacgom-fe.vercel.app/vachistory/vaccine",
                                        isBlueStatusBar: false,
                                        showBottomBar: true,
                                        isReplace: false));
                              },
                              child: VaccineInfoCard()),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              NotYetVaccine(),
              SizedBox(
                height: 10.h,
              ),
              TodoCard()
            ]),
          )),
    );
  }
}
