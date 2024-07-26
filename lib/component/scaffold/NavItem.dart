import 'package:flutter/material.dart';
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
          width: 55,
          alignment: Alignment.center,
          child: Column(
            children: [
              SvgPicture.asset(
                isSelected ? iconSelected : iconUnselected,
                width: 25,
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontFamily: 'Pretendard',
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Color(0xFF4196FD) : Color(0xFFB0B8C1),
                ),
              )
            ],
          )),
      onTap: () {
        navigationShell.goBranch(index);
      },
    );
  }
}
