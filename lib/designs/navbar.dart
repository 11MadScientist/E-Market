import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            child: Container(
              width: size.width,
              height: 80,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size(size.width, 80),
                    painter:BNBCustomPainter(),
                  ),
                  Center(
                    heightFactor: 0.6,
                    child: FloatingActionButton(
                      onPressed:()
                      {},
                      backgroundColor: Colors.orange[500],
                      child: Icon(Icons.shopping_basket),
                        elevation: 0.1,
                    ),
                  ),
                  Container(
                    width: size.width,
                    height: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          icon: Icon(Icons.home),
                          color: Colors.white,
                          onPressed: ()
                          {},
                        ),
                        SizedBox(width: size.width*.20,),
                        IconButton(
                          icon: Icon(Icons.shop),
                          color: Colors.white,
                          onPressed: ()
                          {},
                        ),
                      ],
                    )
                  ),
                ],
              ),
            ),
          )
        ],
      );

  }
}

class BNBCustomPainter extends CustomPainter
{
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.orange[500]..style = PaintingStyle.fill;
    Path path = Path()..moveTo(0, 20);
    path.quadraticBezierTo(size.width*0.20, 0, size.width*0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width*0.60, 20),
    radius: Radius.circular(10.0), clockwise: false);
    path.quadraticBezierTo(size.width*.60, 0, size.width*.65, 0);
    path.quadraticBezierTo(size.width*.80, 0, size.width, 20);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawShadow(path, Colors.black, 5, true);
    canvas.drawPath(path, paint);


    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
  
}
