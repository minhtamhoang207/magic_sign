import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detect_sign_controller.dart';

class DetectSignView extends GetView<DetectSignController> {
  const DetectSignView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'DetectSignView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
