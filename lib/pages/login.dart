import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:<Widget>[
          ClipPath(
            clipper: MyClipper(),
            child: Container(
              height: 230,
              decoration: BoxDecoration(
                color: Colors.orange[500],
              ),
              child: Center(
                child: Text("e-Market",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 35
                ),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
