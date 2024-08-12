import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/webview/page/main/main_bloc.dart';
import 'package:vacgom_app/webview/route/route_bloc.dart';

class NotYetVaccine extends StatelessWidget {
  final Map<int, String> map = {
    2: "2",
    3: "3",
    5: "6",
    6: "7",
    7: "9",
    8: "10",
    9: "12",
    10: "15",
    13: "11",
    15: "14",
    18: "3",
    19: "3",
    20: "9",
    21: "9"
  };

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainBloc, MainState>(
      builder: (context, state) {
        return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xFFE5E8EB),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Row(
                    children: [
                      state.mainModel?.icon != null
                          ? SvgPicture.network(
                              state.mainModel?.icon ?? "",
                              height: 30.h,
                            )
                          : Container(
                              width: 30.w,
                            ),
                      SizedBox(width: 15.w),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '꼭 맞아야 해요!',
                              style: TextStyle(
                                color: Color(0xFF8B95A1),
                                fontSize: 14.sp,
                                fontFamily: 'Pretendard',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(height: 3.h),
                            Row(
                              children: [
                                Text(
                                  '${state.mainModel?.diseaseName} 백신',
                                  style: TextStyle(
                                    color: Color(0xFF191F28),
                                    fontSize: 16.sp,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w600,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFF2F4F6),
                        width: 1,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20.w,
                    vertical: 15.h,
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              context.read<WebViewRouteBloc>().add(WebviewNavigate(
                                  url:
                                      "https://2024-jeju-vacgom-fe.vercel.app/detailvac/${map[state.mainModel?.vaccinationId]}",
                                  isBlueStatusBar: false,
                                  showBottomBar: true,
                                  isReplace: false));
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset(
                                    "resources/assets/ico/Search3.svg"),
                                SizedBox(width: 10.w),
                                Text(
                                  "백신 정보 보기",
                                  style: TextStyle(
                                    color: Color(0xFF4E5968),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              "resources/assets/ico/ico-arrow-right.svg")
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              GoRouter.of(context).push("/webview2");
                            },
                            child: Row(
                              children: [
                                SvgPicture.asset("resources/assets/ico/sy.svg"),
                                SizedBox(width: 10.w),
                                Text(
                                  "병원 조회 하기",
                                  style: TextStyle(
                                    color: Color(0xFF4E5968),
                                    fontSize: 16,
                                    fontFamily: 'Pretendard',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SvgPicture.asset(
                              "resources/assets/ico/ico-arrow-right.svg")
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ));
      },
    );
  }
}
