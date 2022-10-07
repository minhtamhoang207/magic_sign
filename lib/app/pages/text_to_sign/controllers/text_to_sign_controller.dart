import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';
import 'package:magic_sign/domain/usecases/sign_language_usecase.dart';

class TextToSignController extends GetxController with StateMixin<TextToSignController>{

  final TextEditingController txtController = TextEditingController();

  final Rx<List<int>> bytes = Rx<List<int>>([]);

  TextToSignController({required this.signLanguageUseCases});

  SignLanguageUseCases signLanguageUseCases;

  MLAsrRecognizer recognizer =  MLAsrRecognizer();
  final setting = MLAsrSetting(
    language: MLAsrConstants.LAN_EN_US,
    feature: MLAsrConstants.FEATURE_WORDFLUX,
  );

  @override
  void onInit() {
    change(this, status: RxStatus.empty());
    super.onInit();
  }

  startRecognizingWithUi() async {
    txtController.text = await recognizer.startRecognizingWithUi(setting)??'';
  }

  getSignVideo() async {
    try {
      change(this, status: RxStatus.loading());
      bytes.value = await signLanguageUseCases.getSignVideo(content: txtController.text);
      print(bytes.value);
      change(this, status: RxStatus.success());
    } catch (e){
      log(e.toString());
      bytes.value = [];
      change(this, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
