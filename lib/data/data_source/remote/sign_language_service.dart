import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

part 'sign_language_service.g.dart';

@RestApi(
    baseUrl: 'https://5f9e-2405-4802-134-1740-a913-fe77-8d80-e6e.ap.ngrok.io/api/v1'
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

  @POST('/convertImageToSign')
  @DioResponseType(ResponseType.bytes)
  @Headers(<String, dynamic>{
    'Content-Type' : 'application/octet-stream',
  })
  Future<List<int>> getSignLanguageVideoFromImg(
      @Body() MultipartFile fileUpload
  );
}