import 'package:flutter/material.dart';
import 'package:news_app/helper/data.dart';
import 'package:news_app/helper/news.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';

import 'Article.dart';
import 'Category.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = new List<CategoryModel>();
  List<ArticleModel> articles = new List<ArticleModel>();
  bool _isLoading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsname = News();
    await newsname.getNews();
    articles = newsname.news;
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0.0,
        title: Text('FindNews',
            style: TextStyle(fontSize: 25, color: Colors.black)),
      ),
      body: _isLoading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    //categories
                    Container(
                      height: 80,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return CategoryIteam(
                              color: categories[index].color,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    //articles
                    Container(
                      padding: EdgeInsets.only(top: 20),
                      child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: ClampingScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            return BlogItems(
                              imageUrl: articles[index].urlToImage,
                              title: articles[index].title,
                              desc: articles[index].description,
                              url: articles[index].url,
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
    );
  }
}

class CategoryIteam extends StatelessWidget {
  final color, categoryName;
  CategoryIteam({this.color, this.categoryName});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Categories(
                      category: categoryName.toString(),
                    )));
      },
      child: Container(
          margin: EdgeInsets.all(8),
          child: Stack(
            children: [
              Container(
                height: 70,
                width: 150,
                decoration: BoxDecoration(
                    color: color,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(blurRadius: 10, color: Colors.grey),
                    ]),
                child: Center(
                    child: Text(
                  categoryName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black),
                )),
              )
            ],
          )),
    );
  }
}

class BlogItems extends StatelessWidget {
  final String imageUrl, title, desc, url;
  BlogItems(
      {@required this.imageUrl,
      @required this.title,
      @required this.desc,
      @required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Article(articleUrl: url)));
      },
      child: Container(
          margin: EdgeInsets.only(bottom: 15),
          child: Column(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20)),
                  child: Image.network(imageUrl)),
              SizedBox(height: 5),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Text(
                desc,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
              ),
            ],
          )),
    );
  }
}
