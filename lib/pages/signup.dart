import 'package:e_market/designs/passfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/bottomclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/designs/navbar.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}


class _SignUpState extends State<SignUp> {
TextBox nameBox;
TextEditingController _nameController = new TextEditingController();
TextBox emailBox;
TextEditingController _emailController = new TextEditingController();
PassField passBox;
TextEditingController _passwordController = new TextEditingController();
PassField confPassBox;
TextEditingController _confpasswordController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: Stack(
        children:[
          SingleChildScrollView(
            child: SizedBox(
              height: queryData.size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipPath(
                    clipper: MyClipper(),
                    child: Container(
                      height: queryData.size.height/5,
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
                    padding: EdgeInsets.only(left:40.0, right: 40.0, top: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SignUp",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [

                            nameBox = new TextBox(
                              hint: "Full Name",
                              icon: Icons.account_circle,
                              type: TextInputType.text,
                              controller: _nameController,
                            ),
                            SizedBox(height: 20,),
                            emailBox = new TextBox(
                              hint: "Email Address",
                              icon: Icons.email,
                              type: TextInputType.emailAddress,
                              controller: _emailController,

                            ),
                            SizedBox(height: 20,),
                            passBox = new PassField(
                              hint: "Password",
                              controller: _passwordController,),
                            SizedBox(height: 20,),
                            confPassBox = new PassField(
                              hint: "Confirm Password",
                              controller: _confpasswordController,
                            ),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: ()
                              {
                                setState(()
                                {
                                  print(nameBox.getInfo());
                                  print(emailBox.getInfo());
                                  print(passBox.getInfo());
                                  print(confPassBox.getInfo());

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
                                "SIGN UP",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,

                                ),
                              ),
                            ),
                            SizedBox(height: 20,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Have an existing account?",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),),
                                SizedBox(width: 4,),
                                GestureDetector(
                                  onTap: ()
                                  {
                                    Navigator.pushReplacementNamed(context, '/login');
                                  },
                                  child: Text(
                                    "Go to Login!",
                                    style: TextStyle(

                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      decoration: TextDecoration.underline,
                                      decorationColor: Colors.orange[500],
                                      decorationThickness: 2,
                                      color: Colors.orange[500],

                                    ),),
                                ),
                              ],
                            ),

                          ],
                        )

                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}
