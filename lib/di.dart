import 'package:get/get.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';
import 'package:magic_sign/core/helpers/rest_client.dart';
import 'package:magic_sign/core/utils/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DependencyInjection {
  static Future<void> init() async {
    MLLanguageApp().setApiKey(kMLLanguageApiKey);
    await Get.putAsync(()=> SharedPreferences.getInstance());
    Get.put(RestClient().init());
    // await Get.putAsync(() => RestClient().init());
  }
}

