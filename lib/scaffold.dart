import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:vacgom_app/component/scaffold/NavItem.dart';

class ScaffoldWith extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  ScaffoldWith({required this.navigationShell}) {}

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        backgroundColor: Color(0xFFF9FAFB),
        body: Flex(
          direction: Axis.vertical,
          children: [
            Expanded(child: navigationShell),
            Container(
              margin: EdgeInsets.only(left: 10, right: 10),
              padding: EdgeInsets.symmetric(vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFF2F4F6),
                    width: 1,
                  ),
                ),
              ),
              child: SafeArea(
                top: false,
                left: false,
                right: false,
                child: Flex(
                  direction: Axis.horizontal,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    NavItem(
                        title: "홈",
                        iconSelected:
                            "resources/assets/ico/ico-nav-home-selec.svg",
                        iconUnselected:
                            "resources/assets/ico/ico-nav-home-unselec.svg",
                        index: 1,
                        navigationShell: navigationShell),
                    NavItem(
                        title: "달력",
                        iconSelected:
                            "resources/assets/ico/ico-nav-home-selec.svg",
                        iconUnselected:
                            "resources/assets/ico/ico-nav-home-unselec.svg",
                        index: 2,
                        navigationShell: navigationShell),
                    NavItem(
                        title: "병원조회",
                        iconSelected:
                            "resources/assets/ico/ico-nav-vachistory-selec.svg",
                        iconUnselected:
                            "resources/assets/ico/ico-nav-vachistory-unselec.svg",
                        index: 3,
                        navigationShell: navigationShell),
                    NavItem(
                        title: "백신",
                        iconSelected:
                            "resources/assets/ico/ico-nav-vaclookup-selec.svg",
                        iconUnselected:
                            "resources/assets/ico/ico-nav-vaclookup-unselec.svg",
                        index: 4,
                        navigationShell: navigationShell),
                    NavItem(
                        title: "마이",
                        iconSelected:
                            "resources/assets/ico/ico-nav-my-selec.svg",
                        iconUnselected:
                            "resources/assets/ico/ico-nav-my-unselec.svg",
                        index: 5,
                        navigationShell: navigationShell)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
