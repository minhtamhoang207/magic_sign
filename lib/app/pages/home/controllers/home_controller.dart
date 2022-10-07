import 'dart:developer';

import 'package:get/get.dart';

import '../../../../data/models/news.dart';
import '../../../../domain/usecases/news_usecase.dart';

class HomeController extends GetxController with StateMixin<HomeController>{

  HomeController({required this.newsUseCases});
  NewsUseCases newsUseCases;

  Rx<List<Article>> news = Rx<List<Article>>([]);
  final List<String> listFeature = [
    'Translate text/speech into sign language',
    'Translate sign language  into text/speech',
    'Learning sign language',
    'Sign Language Dictionary'
  ];

  @override
  void onInit() async {
    await getListNews();
    super.onInit();
  }

  getListNews() async {
    try {
      change(this, status: RxStatus.loading());
      final response =  await newsUseCases.getListNews(topic: 'Technology');
      news.value = response.articles??[];
      change(this, status: RxStatus.success());
    } catch (e){
      log(e.toString());
      change(this, status: RxStatus.error(e.toString()));
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
