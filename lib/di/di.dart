import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';
import '../data/local_service.dart';


class DependencyInjection {
  static Future<void> init() async {
    MLLanguageApp().setApiKey('DAEDAIBN9oDu/suRBVaXeMO8iinlHnoYiQu0/2rDr4lykqi4D15ExLkPRoXvDXNktu/Eqku2OA+vwrlbfhGWwEvJa91wL5V1qzndFQ==');
    Get.put(Dio());
    // await Get.putAsync(() => RestClient().init());
    await Get.putAsync(() => StorageService().init());
  }
}

