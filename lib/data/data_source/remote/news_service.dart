import 'package:dio/dio.dart';

import '../../models/news.dart';

class NewsService {
  NewsService(this.dio);
  Dio dio;

  Future<News> getListNews(String topic) async {
    final response = await dio.get(
        'https://appups-avep4az4yq-de.a.run.app/api/v1/news',
        queryParameters: {'q': topic}
    );
    print(response.data[0].runtimeType);
    return News.fromJson(response.data[0]);
  }
}