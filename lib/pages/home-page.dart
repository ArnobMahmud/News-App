import 'package:flutter/material.dart';
import 'package:news_app/database/news.dart';
import 'package:news_app/database/temp-db.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = new List<CategorieModel>();
  List<ArticleModel> articles = new List<ArticleModel>();

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Flutter",
              style: TextStyle(fontSize: 26),
            ),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontSize: 30),
            )
          ],
        ),
      ),
      body: _loading
          ? Center(child: Container(child: CircularProgressIndicator()))
          : Column(
              children: [
                Container(
                  height: 70.0,
                  child: ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return CategoryTile(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categorieName: categories[index].categorieName,
                      );
                    },
                  ),
                ),
                Container(
                
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: articles.length,
                    itemBuilder: (context, index) {
                      return BlogTile(
                        imageUrl: articles[index].urlToImage,
                        title: articles[index].title,
                        desc: articles[index].description,
                      );
                    },
                  ),
                )
              ],
            ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String title, imageUrl, desc;

  const BlogTile({Key key, this.title, this.imageUrl, this.desc})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Image.network(imageUrl),
          Text(title),
          Text(desc),
        ],
      ),
    );
  }
}
