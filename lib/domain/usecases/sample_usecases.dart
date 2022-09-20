import 'dart:async';

import 'package:magic_sign/domain/entities/sample.dart';
import 'package:magic_sign/domain/repositories/sample_repository.dart';

class SampleUseCases {
  final SampleRepository sampleRepository;

  SampleUseCases({required this.sampleRepository});

  FutureOr<Sample?> getSomething(String? param) async {
    if(param == null) {
      throw NullThrownError();
    }
    final response = await sampleRepository.getSomething();
    return response;
    // return response.data;
  }
}