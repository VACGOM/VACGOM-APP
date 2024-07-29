import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/component/VacgomHeader.dart';
import 'package:vacgom_app/component/vacbutton.dart';

import '../../webview/route/route_bloc.dart';

class OnboardingOptionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VacgomHeader(
                    onTap: () {
                      context.pop();
                    },
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(
                      vertical: 30.h,
                    ),
                    child: Text(
                      "아이를 등록한 후\n백곰을 시작해 보세요!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF191F28),
                        fontSize: 24.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: SvgPicture.asset(
                        "resources/assets/image/vac_onboarding.svg"),
                  ),
                ],
              ),
              Column(
                children: [
                  Vacbutton(
                      text: "아이 정보 입력하기",
                      isPrimary: true,
                      onPressed: () {
                        context.read<WebViewRouteBloc>().add(WebviewNavigate(
                            url: "http://localhost:3000/signup",
                            isBlueStatusBar: false,
                            showBottomBar: false,
                            isReplace: false));
                      }),
                  SizedBox(
                    height: 10.h,
                  ),
                  Vacbutton(
                      text: "초대 코드로 연결하기", isPrimary: false, onPressed: () {})
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
