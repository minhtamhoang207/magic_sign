import 'package:camera/camera.dart';
import 'package:get/get.dart';

class DetectSignController extends GetxController {
  //TODO: Implement DetectSignController

  CameraController? controller;
  List<CameraDescription> cameras = [];
  final count = 0.obs;
  @override
  void onInit() async {
    cameras = await availableCameras();
    controller = CameraController(CameraDescription(
        name: cameras.first.name,
        lensDirection: cameras.first.lensDirection,
        sensorOrientation: cameras.first.sensorOrientation
    ), ResolutionPreset.high);
    controller!.initialize();
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
