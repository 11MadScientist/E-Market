import 'package:flutter/material.dart';

class BottomClip extends CustomClipper<Path>
{
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height - size.height/4);
    var firstControlPoint = Offset(size.width/4, size.height/4);
    var firstEndPoint = Offset(size.width/2, size.height/4);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(size.width - size.width/4, size.height/4);
    var secondEndPoint = Offset(size.width, size.height - size.height/4);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, 0);


    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }

}