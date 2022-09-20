import '../entities/sample.dart';

abstract class SampleRepository {
  Future<Sample> getSomething();
}