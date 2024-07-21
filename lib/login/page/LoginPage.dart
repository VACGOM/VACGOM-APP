import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vacgom_app/auth/auth_bloc.dart';
import 'package:vacgom_app/component/KakaoButton.dart';
import 'package:vacgom_app/login/bloc/login_bloc.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginSuccess) {
            context.read<AuthBloc>().add(AuthTokenChanged(state.token));
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xFF4196FD),
          appBar: AppBar(
            backgroundColor: Color(0xFF4196FD),
            elevation: 0,
          ),
          body: SafeArea(
            child: Flex(
              direction: Axis.vertical,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 100),
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    "resources/assets/image/img-splash.svg",
                    width: 180,
                  ),
                ),
                KakaoButton(
                  onPressed: () {
                    context
                        .read<LoginBloc>()
                        .add(KakaoLoginButtonPressedEvent());
                  },
                )
              ],
            ),
          ),
        ));
  }
}
