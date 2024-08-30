import 'package:get/get.dart';
import 'package:newsapp/api/news_api.dart';
import 'package:newsapp/config.dart';

class NewsRepository extends GetxService {
  final NewsApi newsApi;

  NewsRepository({required this.newsApi});

  Future<Response> getLastetstNews() async {
    return await newsApi.fetchlatestNews(endpoint: endPoint);
  }
}
