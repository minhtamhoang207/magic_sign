import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:magic_sign/presentation/detect_sign/views/detect_sign_view.dart';
import 'package:magic_sign/presentation/explore/views/explore_view.dart';
import 'package:magic_sign/presentation/home/views/home_view.dart';
import 'package:magic_sign/presentation/learning/views/learning_view.dart';
import 'package:magic_sign/presentation/profile/views/profile_view.dart';

class DashBoardController extends GetxController {


  final RxInt pageIndex = 0.obs;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey();
  final List<Widget> pages = const [
    HomeView(),
    ExploreView(),
    DetectSignView(),
    LearningView(),
    ProfileView()
  ];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void setIndex({required int index}) => pageIndex.value = index;
}