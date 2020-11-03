import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final imageAssetUrl, categorieName;

  const CategoryTile({Key key, this.imageAssetUrl, this.categorieName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          children: [
            Image.network(
              imageAssetUrl,
              height: 80,
              width: 120,
              fit: BoxFit.cover,
            ),
            Container(child: Text(categorieName))
          ],
        ),
      ),
    );
  }
}
