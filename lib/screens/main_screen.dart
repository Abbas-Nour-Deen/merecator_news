import 'package:custom_refresh_indicator/custom_refresh_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/news_controller.dart';
import 'package:newsapp/widgets/news_item.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(toolbarHeight: 15),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: GetBuilder<NewsController>(
            init: NewsController(newsRepository: Get.find()),
            builder: (controller) => controller.obx(
              (state) => CustomMaterialIndicator.adaptive(
                  onRefresh: () async => await controller.fetchLatestNews(),
                  backgroundColor: Colors.white,
                  indicatorBuilder: (context, controller) {
                    return const Padding(
                      padding: EdgeInsets.all(6.0),
                      child: CircularProgressIndicator.adaptive(),
                    );
                  },
                  child: ListView.builder(
                    itemCount: controller.lastestNews.length,
                    itemBuilder: (context, index) {
                      return NewsItem(news: controller.lastestNews[index]);
                    },
                  )),
              onEmpty: const Center(
                child: Text("No results found!"),
              ),
              onError: (error) => Container(
                margin: const EdgeInsets.only(top: 20),
                child: const Center(
                    child: Text("An error occured, try again later")),
              ),
            ),
          ),
        ));
  }
}
