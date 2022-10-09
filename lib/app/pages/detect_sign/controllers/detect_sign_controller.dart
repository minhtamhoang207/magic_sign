import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide MultipartFile ;

import '../../../../domain/usecases/sign_language_usecase.dart';

class DetectSignController extends GetxController {

  DetectSignController({required this.signLanguageUseCases});

  SignLanguageUseCases signLanguageUseCases;

  final Rx<List<int>> bytes = Rx<List<int>>([]);


  @override
  void onInit() async {
    super.onInit();
  }

  getSignVideo(MultipartFile multipartFile) async {
    try {
      bytes.value = await signLanguageUseCases.getSignVideoFromImg(
          fileUpload: multipartFile
      );
      print(bytes.value);
    } catch (e){
      log(e.toString());
      bytes.value = [];
    }
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
