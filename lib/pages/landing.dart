import 'package:flutter/material.dart';
import 'package:e_market/designs/textbox.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assests/background.png"),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
                child: Container(

              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assests/landing-illustration.png")
                  )
              ),
            )),

            Positioned(
              top: 150,
              child: Container(
                child: Text(
                  'Order Online. \nStay Safe With Us!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
