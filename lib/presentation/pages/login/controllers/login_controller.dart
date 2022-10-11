import 'dart:developer';
import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:huawei_account/huawei_account.dart';
import 'package:magic_sign/core/helpers/exception.dart';
import 'package:magic_sign/core/utils/focus.dart';
import 'package:magic_sign/data/data_source/local/local_storage.dart';
import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../../config/routes/app_pages.dart';

class LoginController extends GetxController {
  AuthUseCase authUseCase;
  LoginController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  huaweiSignInAnonymously() async {
    try {
      BotToast.showLoading();
      SignInResult signInResult = await AGCAuth.instance.signInAnonymously();
      TokenResult token = await signInResult.user!.getToken();
      log('TOKEN ${token.token}');
      LocalStorage().saveToken(token: token.token ?? '');
      Get.offAllNamed(Routes.DASH_BOARD);
      BotToast.closeAllLoading();
    } catch (e) {
      log(e.toString());
      BotToast.showText(text: e.toString());
      BotToast.closeAllLoading();
    }
  }

  loginWithHuaweiID() async {
    try {
      AccountAuthParamsHelper paramsHelper = AccountAuthParamsHelper()
        ..setProfile()
        ..setAccessToken();
      final AccountAuthService authService =
          AccountAuthManager.getService(paramsHelper.createParams());
      AuthAccount account = await authService.signIn();
      print('--------------->>>>>>>>>>');
      print(account.toMap().toString());
      print('--------------->>>>>>>>>');
    } catch (e) {
      print('aaaaaaaaaaaaaa');
      print(e.toString());
      print('aaaaaaaaaaaaaa');
    }
  }

  Future<void> login() async {
    try {
      if (userName.text.isNotEmpty && password.text.isNotEmpty) {
        AppFocus.unFocus();
        BotToast.showLoading();
        final response = await authUseCase.login(
            userAuth: UserAuth(
          username: userName.text,
          password: password.text,
        ));
        LocalStorage().saveToken(token: response.data['accessToken']);
        Get.offAllNamed(Routes.DASH_BOARD);
        BotToast.closeAllLoading();
      }
    } on ErrorEntity catch (e) {
      log(e.toString());
      BotToast.showText(text: e.message);
      BotToast.closeAllLoading();
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
}
