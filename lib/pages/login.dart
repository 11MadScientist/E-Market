import 'package:e_market/designs/passfield.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/bottomclipper.dart';
import 'package:e_market/designs/textbox.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

  TextBox box1;
  PassField pass1;


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body:SingleChildScrollView(
        child: SizedBox(
            height: height,
            child: Column(
              children:<Widget>[
                ClipPath(
                  clipper: MyClipper(),
                  child: Container(
                    height: queryData.size.height/4,
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
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children:<Widget> [
                          SizedBox(height: 7,),
                          Text(
                            "Please login to your account.",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SizedBox(height: 30,),
                          box1 = new TextBox(hint: "Email Address", icon: Icons.email,
                            type: TextInputType.emailAddress,),
                          SizedBox(height: 30,),
                          pass1 = new PassField(),
                          SizedBox(height: 20,),
                          TextButton(
                            onPressed: ()
                            {
                              setState(() {
                                print(box1.getInfo());
                                print(pass1.getInfo());

                              });
                            },
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty
                                  .all(Colors.orange[500]),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>
                                (RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(200),
                              )),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.symmetric(vertical: 13, horizontal: 0)),
                            ),

                            child: Text(
                              "LOGIN",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25,

                              ),
                            ),
                          ),
                        ],
                      ),
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
                Spacer(),
                Container(
                  color: Colors.orange[500],
                  child: ClipPath(
                    clipper: BottomClip(),
                    child: Container(
                      height: queryData.size.height/6,
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),

                    ),
                  ),
                ),

               ])),
      )
    );
  }
}
