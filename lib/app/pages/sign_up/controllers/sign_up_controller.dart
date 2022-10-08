import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../routes/app_pages.dart';

class SignUpController extends GetxController with StateMixin<SignUpController> {

  AuthUseCase authUseCase;
  SignUpController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  @override
  void onInit() {
    change(this, status: RxStatus.success());
    super.onInit();
  }

  register() async {
    try{
      change(this, status: RxStatus.loading());
      if(email.text.isEmail && password.text == confirmPassword.text){
        await authUseCase.register(userAuth: UserAuth(
            username: userName.text,
            password: password.text,
            email: email.text
        ));
        Get.offAllNamed(Routes.DASH_BOARD);
        change(this, status: RxStatus.success());
      }
    } catch(e){
      log(e.toString());
      change(this, status: RxStatus.success());
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
