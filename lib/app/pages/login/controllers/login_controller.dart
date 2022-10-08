import 'dart:developer';

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/models/user_sign_up.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import '../../../routes/app_pages.dart';

class LoginController extends GetxController with StateMixin<LoginController> {

  AuthUseCase authUseCase;
  LoginController({required this.authUseCase});

  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void onInit() {
    change(this, status: RxStatus.success());
    super.onInit();
  }

  huaweiLogin() async {
    try {
      SignInResult signInResult = await AGCAuth.instance.signInAnonymously();
      print('--------------->>>>>>>>>>');
      TokenResult token = await signInResult.user!.getToken();
      print('TOKEN ${token.token}');
      inspect(signInResult.user?.getToken() ?? '');
      print('--------------->>>>>>>>>');
    } catch (e) {
      print('-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
      print(e.toString());
      print('-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
    }
    //     .then((signInResult){
    //   print('huhu');
    //   AGCUser? user = signInResult.user;
    //     print('--------------->>>>>>>>>>');
    //   print(user.toString());
    //     print('--------------->>>>>>>>>');
    // })
    //     .catchError((error){
    //   print('-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
    //   print(error.toString());
    //   print('-<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<');
    // });
    // try {
    //   AccountAuthParamsHelper paramsHelper = AccountAuthParamsHelper()..setProfile()..setAccessToken();
    // final AccountAuthService authService = AccountAuthManager.getService(paramsHelper.createParams());
    // AuthAccount account = await authService.signIn();
    //   print('--------------->>>>>>>>>>');
    // print(account.toMap().toString());
    //   print('--------------->>>>>>>>>');
    // } catch (e){
    //   print('aaaaaaaaaaaaaa');
    //   print(e.toString());
    //   print('aaaaaaaaaaaaaa');
    //
    // }
  }


  login() async {
    try{
      if(userName.text.isNotEmpty && password.text.isNotEmpty){
        change(this, status: RxStatus.loading());
        await authUseCase.login(userAuth: UserAuth(
            username: userName.text,
            password: password.text,
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
  void onClose() {}
}
