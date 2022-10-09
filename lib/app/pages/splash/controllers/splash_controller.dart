import 'package:get/get.dart';
import 'package:magic_sign/data/data_source/local/local_storage.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<SplashController>{

  @override
  void onInit() async {
    await Future.delayed(const Duration(seconds: 1));
    String? token = await LocalStorage().getToken();
    if(token != null && token.isNotEmpty){
      Get.offAllNamed(Routes.DASH_BOARD);
    } else {
      Get.offAllNamed(Routes.INTRO);
    }
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
}
