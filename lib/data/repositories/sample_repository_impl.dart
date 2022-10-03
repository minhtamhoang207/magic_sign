import 'package:magic_sign/data/data_source/remote/sample_service.dart';
import 'package:magic_sign/data/models/coffee.dart';
import 'package:magic_sign/domain/repositories/sample_repository.dart';

class SampleRepoImpl implements SampleRepository {

  SampleRepoImpl({required this.sampleService});
  SampleService sampleService;

  @override
  Future<List<Coffee>> getListIcedCoffee() async  {
    return await sampleService.getListIcedCoffee();
  }
}