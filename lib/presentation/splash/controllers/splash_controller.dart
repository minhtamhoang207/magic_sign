import 'package:get/get.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';

class SplashController extends GetxController with StateMixin<SplashController>{
  SampleUseCases sampleUseCases;
  SplashController({required this.sampleUseCases});

  final count = 0.obs;
  @override
  void onInit() {
    sampleUseCases.getSomething('Pass param here');
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
