import 'package:get/get.dart';
import 'package:magic_sign/presentation/detect_sign/controllers/detect_sign_controller.dart';

import '../controllers/dash_board_controller.dart';

class DashBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DashBoardController>(
      () => DashBoardController(),
    );
    Get.lazyPut<DetectSignController>(
          () => DetectSignController(),
    );
  }
}
