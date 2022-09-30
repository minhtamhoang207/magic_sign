import 'dart:developer';

import 'package:agconnect_auth/agconnect_auth.dart';
import 'package:get/get.dart';
import 'package:huawei_account/huawei_account.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  huaweiLogin () async {

  try {
    SignInResult signInResult = await AGCAuth.instance.signInAnonymously();
    print('--------------->>>>>>>>>>');
    TokenResult token = await signInResult.user!.getToken();
    print('TOKEN ${token.token}');
    inspect(signInResult.user?.getToken()??'');
    print('--------------->>>>>>>>>');
  } catch (e){
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

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
