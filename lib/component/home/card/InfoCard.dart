import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/webview/page/main/main_bloc.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<WebViewRouteBloc>().add(WebviewNavigate(
            url: "https://2024-jeju-vacgom-fe.vercel.app/vacscore",
            isBlueStatusBar: false,
            showBottomBar: true,
            isReplace: false));
      },
      child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 20.w,
            vertical: 15.h,
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Color(0xFFE5E8EB),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(15.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '백곰 점수',
                    style: TextStyle(
                      color: Color(0xFF8B95A1),
                      fontSize: 14.sp,
                      fontFamily: 'Pretendard',
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.30,
                    ),
                  ),
                  SizedBox(height: 3.h),
                  Row(
                    children: [
                      BlocBuilder<MainBloc, MainState>(
                        builder: (context, state) {
                          return Text(
                            '${state.mainModel?.score}점',
                            style: TextStyle(
                              color: Color(0xFF333D4B),
                              fontSize: 18.sp,
                              fontFamily: 'Pretendard',
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        },
                      ),
                      Text(
                        ' / 100',
                        style: TextStyle(
                          color: Color(0xFFB0B8C1),
                          fontSize: 16.sp,
                          fontFamily: 'Pretendard',
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SvgPicture.asset(
                "resources/assets/ico/shield-check-filled.svg",
                height: 30.h,
              )
            ],
          )),
    );
  }
}
