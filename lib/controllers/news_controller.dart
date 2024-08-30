import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/api/news_repo.dart';
import 'package:newsapp/model/news.dart';
import 'package:share_plus/share_plus.dart';

class NewsController extends GetxController with StateMixin {
  final NewsRepository newsRepository;

  NewsController({required this.newsRepository});

  RxList<NewsModel> lastestNews = <NewsModel>[].obs;

  Future<void> fetchLatestNews() async {
    change(lastestNews, status: RxStatus.loading());

    try {
      final Response response = await newsRepository.getLastetstNews();

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = response.body;
        List<dynamic> newsData = responseData['articles'];

        lastestNews.value =
            newsData.map((item) => NewsModel.fromJson(item)).toList();

        change(lastestNews, status: RxStatus.success());
      } else if (response.statusCode == 404 ||
          response.statusCode == 400 ||
          response.statusCode == 500) {
        change(lastestNews, status: RxStatus.error("Try again later!"));
        showErrorDialog(
          title: "Failed to fetch data",
          content: "An error occured, try again later!",
        );
      } else {
        change(lastestNews,
            status: RxStatus.error(
                "Chceck your enternet connection\n and try again!"));

        showErrorDialog(
          title: "Failed to fetch data",
          content: "Chceck your enternet connection and try again!",
        );
      }
    } on SocketException {
      showErrorDialog(
        title: "Failed to fetch data",
        content: "Chceck your enternet connection\n and try again!",
      );
    }
  }

  void showErrorDialog({required String title, required String content}) {
    Get.dialog(
        barrierDismissible: false,
        AlertDialog.adaptive(
          title: Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          content: Text(
            content,
            textAlign: TextAlign.center,
          ),
          actions: [
            ElevatedButton(
                onPressed: () async {
                  Get.back();
                  await fetchLatestNews();
                },
                child: const Text("Retry"))
          ],
        ));
  }

  void shareNewsData({required NewsModel news}) async {
    final box = Get.context!.findRenderObject() as RenderBox?;

    await Share.share(
      "${news.customUrlTitle}\n${news.description}",
      sharePositionOrigin: box!.localToGlobal(Offset.zero) & box.size,
    );
  }

  @override
  void onInit() {
    super.onInit();
    fetchLatestNews();
  }
}
