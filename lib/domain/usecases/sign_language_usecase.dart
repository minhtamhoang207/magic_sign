import 'dart:async';

import 'package:magic_sign/domain/repositories/sign_language_repository.dart';


class SignLanguageUseCases {
  final SignLanguageRepository signLanguageRepository;

  SignLanguageUseCases({required this.signLanguageRepository});

  FutureOr<List<int>> getSignVideo({required String content}) async {
    try {
      final response = await signLanguageRepository.getSignVideo(txt: content);
      print(response.runtimeType);
      return response;
    } catch (e){
      rethrow;
    }
  }
}