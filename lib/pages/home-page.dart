import 'package:flutter/material.dart';
import 'package:news_app/database/temp-db.dart';
import 'package:news_app/models/category_model.dart';
import 'package:news_app/pages/category-page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategorieModel> categories = new List<CategorieModel>();

  @override
  void initState() {
    super.initState();
    categories = getCategories();
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
      body: Container(
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
    );
  }
}
