import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:newsapp/controllers/news_controller.dart';
import 'package:newsapp/model/news.dart';

class SelectedNewsScreen extends StatelessWidget {
  final NewsModel news;
  SelectedNewsScreen({super.key, required this.news});

  final NewsController newsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 15),
            child: InkWell(
                onTap: () {
                  newsController.shareNewsData(news: news);
                },
                child: const Icon(Icons.share)),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                imageWidget(),
                info(),
                content(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageWidget() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: Get.height * 0.3,
          child: Hero(
            tag: news.mainImage,
            child: CachedNetworkImage(
              imageUrl: news.mainImage,
              placeholder: (context, url) => SvgPicture.asset(
                "assets/images/placeholder.svg",
                fit: BoxFit.cover,
              ),
              fadeInDuration: const Duration(milliseconds: 700),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }

  Widget content() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Text(
            news.customUrlTitle,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            news.description,
            style: const TextStyle(fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(news.description)
        ],
      ),
    );
  }

  Widget info() {
    return Container(
      margin: const EdgeInsets.only(top: 15),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                news.source,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.grey),
              ),
              Text(
                news.date,
                style: const TextStyle(
                    fontWeight: FontWeight.w600, color: Colors.grey),
              )
            ],
          ),
          news.author.isNotEmpty
              ? Text(news.author,
                  style: const TextStyle(
                      fontWeight: FontWeight.w600, color: Colors.grey))
              : Container()
        ],
      ),
    );
  }
}
