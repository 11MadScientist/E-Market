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
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Stack(
              children: <Widget>[
              Container(
                width: queryData.size.width,
                height: queryData.size.height,
                padding: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/background.png'),
                      fit: BoxFit.cover
                      ))),

                Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  width: 100,
                  height: 130,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/e-merkado.png')
                      ))),
                Container(
                margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Column(
                children: <Widget>
                [
                  AutoSizeText("E-Merkado",
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Poppins'
                                  ),),

                  AutoSizeText("A one-tap-away public market",
                                  style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        fontFamily: 'Poppins'
                                  ),),

                                  ],
                                )
                  ,)
                ],),


              Container(
                alignment: Alignment.center,
                width: queryData.size.width,
                height: queryData.size.height,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('lib/assets/landing-illustration.png'),
                      )),
              child: Column(
               mainAxisAlignment: MainAxisAlignment.center,
               children: <Widget>[
               Container(
                 margin: const EdgeInsets.fromLTRB(0, 520, 0, 0),
                child:  ElevatedButton(
                child: Text("I'm a Seller", style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins'
                ),), onPressed: ()=>{},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  shadowColor: Colors.orange[200],
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 10,
                ),
                ),),

                 Container(
                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                child:  ElevatedButton(
                child: Text("I'm a Buyer", style: TextStyle(
                fontSize: 22,
                fontFamily: 'Poppins'
                ),), onPressed: ()=>{},
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  padding: const EdgeInsets.fromLTRB(30, 15, 30, 15),
                  shadowColor: Colors.orange[200],
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                  elevation: 10,
                ),
                ),),

                

              ],)
              ),
                   
              
              ], 
            ),
                 
          ],
        ),
      ),
    );
  }
}
