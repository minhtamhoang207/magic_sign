import 'package:magic_sign/data/data_source/remote/sign_language_service.dart';
import 'package:magic_sign/domain/repositories/sign_language_repository.dart';


class SignLanguageRepoImpl implements SignLanguageRepository {

  SignLanguageRepoImpl({required this.signLanguageService});
  SignLanguageService signLanguageService;

  @override
  Future<List<int>> getSignVideo({required String txt}) async  {
    return await signLanguageService.getSignLanguageVideo(txt);
  }
}