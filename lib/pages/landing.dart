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
          children: <Widget>[
            Positioned(
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image:
                          AssetImage("lib/assests/landing-illustration.png"))),
            )),
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 50.0, 0, 0),
                  child: Text('STAY AT HOME'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
