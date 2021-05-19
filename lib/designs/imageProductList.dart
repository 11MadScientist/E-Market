import 'package:flutter/material.dart';

class ImageRow extends StatelessWidget {
  final String imageData;

  const ImageRow({this.imageData});

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    return Container(
      width: queryData.size.width * .35,
      height: queryData.size.height * .15,
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: AssetImage(imageData),
          fit: BoxFit.cover,
        ),
      ),
      child: IconButton(
        icon: Icon(
          Icons.add_photo_alternate_rounded,
          color: Colors.white,
        ),
        iconSize: 50,
      ),
    );
  }
}
