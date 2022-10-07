import 'package:get/get.dart';
import 'package:magic_sign/data/models/news.dart';

class NewsDetailController extends GetxController {

  final heroTag = Get.arguments['heroTag'];

  final Article? article = Get.arguments['article'];

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
