import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/learning_controller.dart';

class LearningView extends GetView<LearningController> {
  const LearningView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'LearningView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
