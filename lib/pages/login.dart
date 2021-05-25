import 'package:e_market/designs/passfield.dart';
import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/bottomclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/designs/popup.dart';
import 'package:e_market/traps/profile_trap.dart';
import 'package:flutter_session/flutter_session.dart';

import 'MyBottomNavigationBar.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  dynamic _profile;

  TextBox emailBox;
  TextEditingController _emailController = new TextEditingController();
  PassField passBox;
  TextEditingController _passwordController = new TextEditingController();

  PopUp popup;
  FocusNode node1 = new FocusNode();
  ProfileTrap trap = ProfileTrap();

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
        body: GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: SingleChildScrollView(
        child: SizedBox(
            height: queryData.size.height,
            child: Column(children: <Widget>[
              ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: queryData.size.height / 4,
                  decoration: BoxDecoration(
                    color: Colors.orange[500],
                  ),
                  child: Center(
                    child: Text(
                      "e-Merkado",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 35),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
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
                      children: <Widget>[
                        SizedBox(
                          height: 7,
                        ),
                        Text(
                          "Please login to your account.",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        emailBox = new TextBox(
                          hint: "Email Address",
                          icon: Icons.email,
                          type: TextInputType.emailAddress,
                          controller: _emailController,
                          node: node1,
                          func_a: trap.defaultTrap,
                          func_b: trap.emailExist,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        passBox = new PassField(
                          hint: "Password",
                          controller: _passwordController,
                          func: trap.defaultTrap,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "LOGIN",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
                            fontSize: 13,
                            color: Colors.orange[500],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/landing');
                          },
                          child: Text(
                            "Create new now!",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 13,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.orange[500],
                              decorationThickness: 2,
                              color: Colors.orange[500],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: 20,
                  )),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.orange[500],
                  child: ClipPath(
                    clipper: BottomClip(),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                      ),
                    ),
                  ),
                ),
              ),
            ])),
      ),
    ));
  }

}
