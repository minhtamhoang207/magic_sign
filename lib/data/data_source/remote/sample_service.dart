import 'package:dio/dio.dart';
import 'package:magic_sign/data/models/coffee.dart';
import 'package:retrofit/http.dart';

part 'sample_service.g.dart';

@RestApi(
  baseUrl: 'https://api.sampleapis.com'
)
abstract class SampleService {
  factory SampleService(Dio dio, {String baseUrl}) = _SampleService;

  @GET('/coffee/iced')
  Future<List<Coffee>> getListIcedCoffee();
}