import 'dart:developer';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends GetxController {

  AuthUseCase authUseCase;
  SignUpController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  register() async {
    try{
      if(email.text.isEmail && password.text == confirmPassword.text){
        BotToast.showLoading();
        await authUseCase.register(userAuth: UserAuth(
            username: userName.text,
            password: password.text,
            email: email.text
        ));
        BotToast.closeAllLoading();
        Get.offAllNamed(Routes.DASH_BOARD);
      }
    } catch(e){
      log(e.toString());
      BotToast.showText(text: 'An error occurred');
      BotToast.closeAllLoading();
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
