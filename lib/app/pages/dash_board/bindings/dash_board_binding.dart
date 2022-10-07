import 'package:get/get.dart';
import 'package:magic_sign/app/pages/explore/controllers/explore_controller.dart';
import 'package:magic_sign/app/pages/home/controllers/home_controller.dart';

import '../../detect_sign/controllers/detect_sign_controller.dart';
import '../controllers/dash_board_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(newsUseCases: Get.find()),
    );
    Get.lazyPut<DetectSignController>(
      () => DetectSignController(),
    );
    Get.lazyPut<ExploreController>(
      () => ExploreController(newsUseCases: Get.find()),
    );
  }
}
