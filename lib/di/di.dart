import 'package:get/get.dart';
import 'package:magic_sign/data/repositories/sample_repository_impl.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';


class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut(() => SampleRepoImpl());
    Get.lazyPut(() => SampleUseCases(sampleRepository: Get.find<SampleRepoImpl>()));
    // AGCApp.instance.setClientId('985528662478573248');
    // AGCApp.instance.setClientSecret('EAEB72AF100FB1C87AD249D5BB33EF757EE2057B8338F297D25E7AF20358011D');
    // AGCApp.instance.setApiKey('DAEDAIBN9oDu/suRBVaXeMO8iinlHnoYiQu0/2rDr4lykqi4D15ExLkPRoXvDXNktu/Eqku2OA+vwrlbfhGWwEvJa91wL5V1qzndFQ==');
    // await Get.putAsync(() => RestClient().init());
    // await Get.putAsync(() => StorageService().init());
  }
}