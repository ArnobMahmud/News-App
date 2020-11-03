import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  final imageAssetUrl, categorieName;

  const CategoryTile({Key key, this.imageAssetUrl, this.categorieName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  imageAssetUrl,
                  height: 100,
                  width: 120,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                  height: 100,
                  width: 120,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    categorieName,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
