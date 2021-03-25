import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Color col;
  final String category;
  final Image img;

  const CategoryCard({this.col, this.category, this.img});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14.0),
            color: col,
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
