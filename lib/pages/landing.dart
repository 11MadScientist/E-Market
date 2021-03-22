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
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/assests/background.png"),
                fit: BoxFit.cover)),
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Positioned(
              top: 250,
              left: 15,
              height: 300,
              width: 300,
                child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("lib/assests/landing-illustration.png"),                    
                  ),
              ),
            )),

            Positioned(
              top: 180,
              child: Container(
                child: Text(
                  'Order Online. \nStay Safe With Us!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.bold,
                    fontSize: 35,
                  ),
                ),
              ),
            ),


          // Positioned(
          //   top: 550,
          //   width: 200,
          //   child: OutlineButton(onPressed: (){},  
          //   color: Colors.black38, 
          //   shape: RoundedRectangleBorder(side: BorderSide(
          //   color: Colors.black87,
          //   width: 4,
          //   style: BorderStyle.solid
          // ), borderRadius: BorderRadius.circular(50)),
          
          //   child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //        Text("I am a Seller",
          //       style: TextStyle(
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.w500,
          //         fontSize: 20, ),),
          //         Icon(
          //           Icons.arrow_forward,
          //           color: Colors.black,
                    
          //         )
          //     ],
          //   ),),
          //   )),
             
             
          //   Positioned(
          //     top: 600,
          //     width: 200,
          //     child:   new OutlineButton(onPressed: (){},  
          //     color: Colors.black38, 
          //     shape: RoundedRectangleBorder(side: BorderSide(
          //     color: Colors.black87,
          //     width: 4,
          //     style: BorderStyle.solid
          // ), borderRadius: BorderRadius.circular(50),),
          
          //   child: Padding(padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          //        Text("I am a Buyer",
          //       style: TextStyle(
          //         fontFamily: 'Poppins',
          //         fontWeight: FontWeight.w500,
          //         fontSize: 20, ),),
          //         Icon(
          //           Icons.arrow_forward,
          //           color: Colors.black,
          //         )
          //     ],
          //   ),),
          //   ))
    Positioned(
            top: 540,
            width: 200,  
              child: OutlinedButton(
                  child: Text("I'm a Seller", style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18, ),),
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    
                  ),
            ),),  

            
            Positioned(
            top: 600,
            width: 200,  
              child: OutlinedButton(
                  child: Text("I'm a Buyer", style: TextStyle(
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 18, ),),
                  onPressed: () => {},
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(32.0),
                    ),
                    padding: EdgeInsets.all(10.0),
                    
                  ),
            ),)  
          ],
        ),
      ),
    );
  }
}
