import 'dart:async';

import 'package:magic_sign/data/models/base_response.dart';
import 'package:magic_sign/domain/repositories/auth_repository.dart';
import 'package:magic_sign/domain/repositories/news_repository.dart';

import '../../data/models/user_sign_up.dart';


class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({required this.authRepository});

  FutureOr<BaseResponse> register({required UserAuth userAuth}) async {
    try {
      final response = await authRepository.register(userAuth: userAuth);
      print(response.runtimeType);
      return response;
    } catch (e){
      rethrow;
    }
  }

  FutureOr<BaseResponse> login({required UserAuth userAuth}) async {
    try {
      final response = await authRepository.login(userAuth: userAuth);
      print(response.runtimeType);
      return response;
    } catch (e){
      rethrow;
    }
  }
}