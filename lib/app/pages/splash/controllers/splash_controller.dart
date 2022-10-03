import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:magic_sign/data/models/coffee.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';
import 'package:path_provider/path_provider.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<SplashController>{
  SampleUseCases sampleUseCases;
  SplashController({required this.sampleUseCases});

  final count = 0.obs;
  final Rx<List<int>> bytes = Rx<List<int>>([]);
  @override
  void onInit() async {
    bytes.value = await getSth();
    // final List<Coffee> icedCoffee = await sampleUseCases.getListIcedCoffee();
    // await Future.delayed(const Duration(seconds: 2));
    // Get.offAllNamed(Routes.INTRO);
    super.onInit();
  }

  Future<List<int>> getSth() async {
    String txt = 'Hello there';
    final value = await Dio().post('https://aae7-2405-4802-13a-1ba0-fcba-a511-a550-fddc.ap.ngrok.io/api/v1/convertToSign?txt=$txt');
    List<int> bytes = value.data.codeUnits;
    return bytes;
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
