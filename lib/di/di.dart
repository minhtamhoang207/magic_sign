import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:huawei_ml_language/huawei_ml_language.dart';
import 'package:magic_sign/data/data_source/remote/news_service.dart';
import 'package:magic_sign/data/data_source/remote/sample_service.dart';
import 'package:magic_sign/data/data_source/remote/sign_language_service.dart';
import 'package:magic_sign/data/repositories/auth_repository_impl.dart';
import 'package:magic_sign/data/repositories/news_repository_impl.dart';
import 'package:magic_sign/data/repositories/sample_repository_impl.dart';
import 'package:magic_sign/data/repositories/sign_language_repository_impl.dart';
import 'package:magic_sign/domain/usecases/auth_usecase.dart';
import 'package:magic_sign/domain/usecases/news_usecase.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';
import 'package:magic_sign/domain/usecases/sign_language_usecase.dart';

import '../data/data_source/remote/auth_service.dart';


class DependencyInjection {
  static Future<void> init() async {
    MLLanguageApp().setApiKey('DAEDAIBN9oDu/suRBVaXeMO8iinlHnoYiQu0/2rDr4lykqi4D15ExLkPRoXvDXNktu/Eqku2OA+vwrlbfhGWwEvJa91wL5V1qzndFQ==');
    Get.put(Dio());

    Get.lazyPut(() => SampleRepoImpl(sampleService: SampleService(Get.find<Dio>())));
    Get.lazyPut(() => SampleUseCases(sampleRepository: Get.find<SampleRepoImpl>()));
    // await Get.putAsync(() => RestClient().init());
    // await Get.putAsync(() => StorageService().init());
  }
}