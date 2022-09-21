import 'package:get/get.dart';
import 'package:magic_sign/data/repositories/sample_repository_impl.dart';
import 'package:magic_sign/domain/usecases/sample_usecases.dart';


class DependencyInjection {
  static Future<void> init() async {
    Get.lazyPut(() => SampleRepoImpl());
    Get.lazyPut(() => SampleUseCases(sampleRepository: Get.find<SampleRepoImpl>()));
    // await Get.putAsync(() => RestClient().init());
    // await Get.putAsync(() => StorageService().init());
  }
}