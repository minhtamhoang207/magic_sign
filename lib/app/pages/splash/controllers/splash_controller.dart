import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:magic_sign/data/models/coffee.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';
import 'package:path_provider/path_provider.dart';
import '../../../routes/app_pages.dart';

class SplashController extends GetxController with StateMixin<SplashController>{
  SampleUseCases sampleUseCases;
  SplashController({required this.sampleUseCases});

  final count = 0.obs;
  final ImagePicker _picker = ImagePicker();
  final Rx<List<int>> bytes = Rx<List<int>>([]);
  TextEditingController userInput = TextEditingController();
  @override
  void onInit() async {
    bytes.value = await getSth();
    // final List<Coffee> icedCoffee = await sampleUseCases.getListIcedCoffee();
    // await Future.delayed(const Duration(seconds: 2));
    // Get.offAllNamed(Routes.INTRO);
    super.onInit();
  }

  Future<List<int>> getSth() async {
    // final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    final String txt = 'Hello Hiep Chan, want to go Wang Wang?';
    final response = await Dio().post(
        'https://9afd-113-160-73-210.ap.ngrok.io/api/v1/convertToSign?txt=$txt',
      options: Options(
        responseType: ResponseType.bytes,
        contentType: 'application/octet-stream',
      ),
    );

    // Uint8List.
    // List<int> list = value.data.codeUnits;
    // String s =  String.fromCharCodes(inputAsUint8List);
    // Uint8List bytes = value.data as Uint8List;
    // writeCounter(bytes);
    // final bytes = await readCounter();
    return response.data;
  }

  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/test.dat');
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();

    return directory.path;
  }

  Future<File> writeCounter(List<int> counter) async {
    final file = await _localFile;
    File a = await file.writeAsString(counter.toList().toString());
    log(a.path);
    return a;
  }

  Future<List<int>> readCounter() async {
    try {
      final file = await _localFile;
      final contents = file.readAsBytesSync();
      return contents;
    } catch (e) {
      // If encountering an error, return 0
      return [];
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

  void increment() => count.value++;
}
