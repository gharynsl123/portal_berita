import 'package:flutter/material.dart';
import 'package:portal_berita/category_item.dart';
import 'package:portal_berita/models/ResponseNews.dart';
import 'package:portal_berita/models/category.dart';
import 'package:portal_berita/news_item.dart';

class NewsPage extends StatelessWidget {
  ResponseNews responseNews;
  List<Category> categories;

  NewsPage(this.responseNews, this.categories);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    return CategoryItem  (
                      categoryName: categories[index].categoryImage,
                      imageAsstUrl: categories[index].imagUrl,
                    );
                  })),
          Container(
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
                itemCount: responseNews.articles.length,
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                itemBuilder: (context, index) {
                  return NewsItem(
                    imgurl: responseNews.articles[index].urlToImage ?? "",
                    title: responseNews.articles[index].title ?? "",
                    decs: responseNews.articles[index].description ?? "",
                    content: responseNews.articles[index].content ?? "",
                    posturl: responseNews.articles[index].url ?? "",
                    name: responseNews.articles[index].source.name ?? "",
                  );
                })),
        ],
      ),
    );
  }
}
