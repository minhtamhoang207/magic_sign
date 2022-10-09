import 'package:get/get.dart';
import 'package:magic_sign/data/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  final SharedPreferences sharedPreferences = Get.find();
  saveToken({required String token}) async {
    await sharedPreferences.setString(AppConstants.token, token);
  }

  Future<String?> getToken() async {
    return sharedPreferences.getString(AppConstants.token);
  }

  clearAll() async {
   await sharedPreferences.clear();
  }
}