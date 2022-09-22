import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:magic_sign/gen/assets.gen.dart';
import '../controllers/dash_board_controller.dart';

class DashBoardView extends GetView<DashBoardController> {
  const DashBoardView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          key: controller.bottomNavigationKey,
          index: 0,
          height: 60.0,
          items: [
            _bottomBarButton(Assets.svg.icCamera, Colors.black),
            _bottomBarButton(Assets.svg.icCamera, Colors.white),
            _bottomBarButton(Assets.svg.icCamera, Colors.white),
            _bottomBarButton(Assets.svg.icCamera, Colors.white),
            _bottomBarButton(Assets.svg.icCamera, Colors.black)
          ],
          color: const Color(0xFFEEEEEE),
          buttonBackgroundColor: const Color(0xFF326273),
          backgroundColor: Colors.transparent,
          animationCurve: Curves.easeInOut,
          animationDuration: const Duration(milliseconds: 300),
          onTap: (index) {
            controller.setIndex(index: index);
          },
          letIndexChange: (index) => true,
        ),
        body: Obx(() => controller.pages[controller.pageIndex.value]));
  }
}

Widget _bottomBarButton(String icon, Color iconColor) {
  return Padding(
    padding: const EdgeInsets.all(12),
    child: SvgPicture.asset(icon, color: iconColor),
  );
}
