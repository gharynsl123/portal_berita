import 'package:flutter/material.dart';
import 'package:portal_berita/helper/data_category.dart';
import 'package:portal_berita/helper/data_request.dart';
import 'package:portal_berita/helper/widget.dart';
import 'package:portal_berita/models/category.dart';
import 'package:portal_berita/news_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  News news = News();

  List<Category> categories = List<Category>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121212),
        appBar: myAppBar(),
        body: SafeArea(
            child: FutureBuilder(
                future: news.getNews(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //jika api memiliki data
                    return NewsPage(snapshot.data, categories);
                  } else if (snapshot.hasError) {
                    //jika api yang gagal akan muncul utlisan tidak tersedia
                    print(snapshot.error);
                    return Center(child: Text("Data tidak tersedia"));
                  }
                  return Center(child: CircularProgressIndicator());
                })));
  }
}
