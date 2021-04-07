import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Landing extends StatefulWidget {
  Landing({Key key}) : super(key: key);

  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    double heightSize = queryData.size.height;
    double widthSize = queryData.size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: Stack(
          children: <Widget>[
            Container(
              width: widthSize,
              height: heightSize,
              padding: EdgeInsets.all(15.0),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('lib/assets/background.png'),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Container(
              height: heightSize,
              child: Column(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
                      child: Container(
                        width: widthSize,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                  width: widthSize * .25,
                                  height: widthSize * .30,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage('lib/assets/e-merkado.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ),
                        Column(
                          children: <Widget>[
                            AutoSizeText(
                              "E-Merkado",
                              style: TextStyle(
                              color: Colors.white,
                              fontSize: widthSize * .08,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins'
                        ),),
                            AutoSizeText(
                              "A one-tap-away public market",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: heightSize < 1366 ? heightSize * .018 : heightSize * .02,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: 'Poppins'
                              ),),
                          ],
                        ),
                          ],
                        ),
                      )),
                  Expanded(
                    flex: 2,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 50.0),
                        width: widthSize,
                        height: heightSize,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('lib/assets/landing-illustration.png'),
                              )),
                      )),
                  Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: <Widget>[
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child:  ElevatedButton(
                              onPressed: ()
                              {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: Text("I'm a Seller", style: TextStyle(
                              fontSize: widthSize * 0.055,
                              fontFamily: 'Poppins'
                              ),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                shadowColor: Colors.orange[200],
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                elevation: 10,
                              ),
                            ),),
                            Container(
                            margin: const EdgeInsets.fromLTRB(0, 15, 0, 0),
                            child:  ElevatedButton(
                              onPressed: ()
                              {
                                Navigator.pushReplacementNamed(context, '/login');
                              },
                              child: Text("I'm a Buyer", style: TextStyle(
                              fontSize: widthSize * 0.055,
                              fontFamily: 'Poppins'
                              ),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.orange,
                                padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                                shadowColor: Colors.orange[200],
                                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                elevation: 10,
                              ),
                            ),),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
    );
  }
}
