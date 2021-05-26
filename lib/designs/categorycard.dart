import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color col;
  final String category;
  String img;

  CategoryCard({this.col, this.category, this.img});

  void setImage()
  {
    if(img == null)
    {
      img = "eggplant3.jpg";
    }
  }

  @override
  Widget build(BuildContext context) {
    setImage();
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: col,
            image: DecorationImage(
              image: AssetImage("lib/assets/$img"),
            ),
          ),
        ),
        Text(
          category,
          style: TextStyle(
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
