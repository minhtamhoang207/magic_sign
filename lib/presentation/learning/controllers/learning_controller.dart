import 'package:get/get.dart';

class LearningController extends GetxController {
  //TODO: Implement LearningController

  final heroTag = Get.arguments;
  final count = 0.obs;
  @override
  void onInit() {
    print(heroTag);
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

  void increment() => count.value++;
}
