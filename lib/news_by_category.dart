import 'package:flutter/material.dart';
import 'package:portal_berita/helper/data_request.dart';
import 'package:portal_berita/helper/widget.dart';
import 'package:portal_berita/models/ResponseNews.dart';
import 'package:portal_berita/news_item.dart';

class NewsByCategories extends StatefulWidget {

  final String newsCategory;

  const NewsByCategories({this.newsCategory});

  @override
  _NewsByCategoriesState createState() => _NewsByCategoriesState(newsCategory);
}

class _NewsByCategoriesState extends State<NewsByCategories> {

  NewsByCategory newsByCategory = NewsByCategory();
  String newsCategory;

  _NewsByCategoriesState(this.newsCategory);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: myAppBar(),
      body: FutureBuilder(
        future: newsByCategory.getNewsByCategory(newsCategory),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListNewsCategory(snapshot.data);
          } else if (snapshot.hasError) {
            print(snapshot.error);
            return Center(child: Text("Data tidak di temukan"));
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

class ListNewsCategory extends StatelessWidget {

  ResponseNews responseNews;

  ListNewsCategory(this.responseNews);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:
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
    );
  }
}

