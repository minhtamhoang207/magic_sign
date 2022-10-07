import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'sign_language_service.g.dart';

@RestApi(
    baseUrl: 'https://appups-avep4az4yq-de.a.run.app/api/v1'
)
abstract class SignLanguageService {
  factory SignLanguageService(Dio dio, {String baseUrl}) = _SignLanguageService;

  @POST('/convertToSign')
  @DioResponseType(ResponseType.bytes)
  @Headers(<String, dynamic>{
    'Content-Type' : 'application/octet-stream',
  })
  Future<List<int>> getSignLanguageVideo(
      @Query('txt') String txt,
  );
}