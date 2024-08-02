import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class NavItem extends StatelessWidget {
  final String title;
  final String iconSelected;
  final String iconUnselected;
  final int index;
  final StatefulNavigationShell navigationShell;

  NavItem({
    required this.title,
    required this.iconSelected,
    required this.iconUnselected,
    required this.index,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = navigationShell.currentIndex == index;
    return GestureDetector(
      child: Container(
          decoration: BoxDecoration(
            color: Colors.transparent,
          ),
          width: 74.w,
          alignment: Alignment.center,
          child: Column(
            children: [
              SvgPicture.asset(
                isSelected ? iconSelected : iconUnselected,
                width: 24.w,
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Color(0xFF4196FD) : Color(0xFFB0B8C1),
                ),
              )
            ],
          )),
      onTap: () {
        navigationShell.goBranch(index, initialLocation: true);
      },
    );
  }
}
