import 'package:e_market/designs/passfield.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/bottomclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/designs/popup.dart';
import 'package:e_market/traps/profile_trap.dart';


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login> {

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
      body:GestureDetector(
        onTap:()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: SingleChildScrollView(
          child: SizedBox(
              height: queryData.size.height,
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
                            emailBox = new TextBox(
                              hint: "Email Address",
                              icon: Icons.email,
                              type: TextInputType.emailAddress,
                              controller: _emailController,
                              node: node1,
                              func_a: trap.defaultTrap,
                              func_b: trap.emailExist,

                            ),
                            SizedBox(height: 30,),
                            passBox = new PassField(
                              hint: "Password",
                              controller: _passwordController,
                              func: trap.defaultTrap,
                            ),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: ()async
                              {
                               await emailBox.validator();
                                
                                if(trap.passwordCheck(passBox.getInfo()))
                                  {
                                    // popUpDialog(queryData);

                                    setState(() {
                                      Navigator.pushReplacementNamed(context, '/home');
                                    });
                                  }
                                else
                                  {
                                    popup = new PopUp(data: queryData,
                                        icon: Icons.error,
                                        title: 'ERROR',
                                        message: 'Incorrect Email/Password',
                                        context: context);
                                    return;
                                  }
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
                            GestureDetector(
                              onTap: ()
                              {
                                Navigator.pushReplacementNamed(context, '/signup');
                              },
                              child: Text(
                                "Create new now!",
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
                    ),
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(height: 20,)),
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
      )
    );
  }

 // Future popUpDialog(MediaQueryData data) async
 //  {
 //      return (
 //      showDialog(
 //          context: context,
 //          barrierDismissible: false,
 //          builder: (BuildContext context){
 //            return AlertDialog(
 //                title: Text(
 //                    'ERROR!',
 //                style: TextStyle(
 //                  fontFamily: 'Poppins',
 //                  fontWeight: FontWeight.bold,
 //                  fontSize: data.size.width * .05,
 //                ),),
 //                content: Container(
 //                  child: Row(
 //                    mainAxisAlignment: MainAxisAlignment.center,
 //                    children: <Widget>[
 //                      Icon(
 //                        Icons.error_outline,
 //                        color: Colors.red,
 //                        size: data.size.width * .15 ,
 //                      ),
 //                      // Expanded(child: SizedBox(width: data.size.width * .005,)),
 //                      Expanded(
 //                        child: Text(
 //                            'Email/Password is incorrect!',
 //                        textAlign: TextAlign.center,
 //                        style: TextStyle(
 //                          fontFamily: 'Poppins',
 //                          fontSize: data.size.width * .05,
 //                        ),),
 //                      ),
 //                    ],
 //                  ),
 //                ),
 //                actions: <Widget>[
 //                  TextButton(
 //                      onPressed: () {
 //                        Navigator.of(context).pop();
 //                      },
 //                      child: Text(
 //                          'Close',
 //                        style: TextStyle(
 //                          fontFamily: 'Poppins',
 //                          fontSize: data.size.width * .04,
 //                        ),
 //                      ))
 //                ],
 //            );
 //          })
 //      );
 //  }
}
