import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/bottomclipper.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  TextEditingController _nameControler = TextEditingController();
  bool secure = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:<Widget>[
            ClipPath(
              clipper: MyClipper(),
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.orange[500],
                ),
                child: Center(
                  child: Text("e-Merkado",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 35
                  ),),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40,0,40,0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 7,),
                  Text(
                    "Please login to your account.",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    decoration: InputDecoration(
                    hintText: "Email Address",
                    enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.orange[500]),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),

                    focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    suffixIcon: Icon(
                    Icons.email,
                    color: Colors.orange[500],
                    ),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    maxLines: 1,
                  ),
                  SizedBox(height: 30,),
                  TextField(
                    decoration: InputDecoration(
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.orange[500]),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),

                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.green),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          secure ? Icons.security:Icons.remove_red_eye,
                          color: Colors.orange[500],
                        ),
                        onPressed: ()
                        {
                          setState(() {
                            secure = !secure;
                          });
                        },
                      ),
                    ),
                    obscureText: secure,
                    maxLines: 1,
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.orange[500],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                         style: TextStyle(
                           fontWeight: FontWeight.bold,
                           fontSize: 14,
                      ),),
                      SizedBox(width: 4,),
                      Text(
                        "Create new now!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.orange[500],
                          decorationThickness: 2,
                          color: Colors.orange[500],
                        ),),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20,),
            Container(
              color: Colors.orange[500],
              child: ClipPath(
                clipper: BottomClip(),
                child: Container(
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.grey[50],
                  ),

                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
