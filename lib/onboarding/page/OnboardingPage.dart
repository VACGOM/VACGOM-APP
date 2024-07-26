import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/component/Input.dart';
import 'package:vacgom_app/component/VacgomHeader.dart';
import 'package:vacgom_app/component/onboarding/FullButton.dart';
import 'package:vacgom_app/onboarding/bloc/onboarding_bloc.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VacgomHeader(
                    onTap: () {
                      context.read<AuthBloc>().add(LogoutRequested());
                    },
                  ),
                  Container(
                    padding: EdgeInsets.all(20.r),
                    child: Text(
                      "닉네임을 입력해주세요",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: Color(0xFF333D4B),
                        fontSize: 20.sp,
                        fontFamily: 'Pretendard',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  Input("닉네임", "띄어쓰기 포함 6글자 이내", (value) {
                    context.read<OnboardingBloc>().add(InputNickname(value));
                  }),
                ],
              ),
              BlocBuilder<OnboardingBloc, OnboardingState>(
                builder: (context, state) {
                  return FullButton(
                      text: "다음",
                      onPressed: () {
                        context
                            .read<OnboardingBloc>()
                            .add(InputNicknameComplete());
                        context.push('/onboarding/option');
                      },
                      isActive: state.isActive());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
