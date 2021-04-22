import 'package:e_market/designs/passfield.dart';
import 'package:e_market/pages/signup2.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/traps/profile_trap.dart';
import 'package:e_market/designs/popup.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
ProfileTrap trap = ProfileTrap();

 Map data;

//first batch
  //name textboxes
  TextBox fnameBox;
  TextEditingController f_nameController = new TextEditingController();
  TextBox lnameBox;
  TextEditingController l_nameController = new TextEditingController();
  String fname;
  String lname;

  //password textboxes
  PassField passBox;
  TextEditingController _passwordController = new TextEditingController();
  PassField confPassBox;
  TextEditingController _confpasswordController = new TextEditingController();
  String pass;
  String confpass;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: GestureDetector(
        onTap:()=> FocusScope.of(context).requestFocus(FocusNode()),
        child: Stack(
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
                              fnameBox = new TextBox(
                                hint: "First Name",
                                icon: Icons.account_circle,
                                type: TextInputType.text,
                                controller: f_nameController,
                                func_a: trap.NameTrap,
                              ),
                              SizedBox(height: 20,),
                              lnameBox = new TextBox(
                                hint: "Last Name",
                                icon: Icons.account_circle,
                                type: TextInputType.text,
                                controller: l_nameController,
                                func_a: trap.NameTrap,
                              ),
                              SizedBox(height: 20,),
                              passBox = new PassField(
                                hint: "Password",
                                controller: _passwordController,
                                func: trap.PassTrap,),
                              SizedBox(height: 20,),
                              confPassBox = new PassField(
                                hint: "Confirm Password",
                                controller: _confpasswordController,
                                func: trap.PassTrap,
                              ),
                              SizedBox(height: 20,),
                              TextButton(
                                onPressed: ()async
                                {
                                //checking if an error exists in validation
                                    await fnameBox.validator();
                                    await lnameBox.validator();
                                    await passBox.validator();
                                    await confPassBox.validator();

                                    if(!fnameBox.validation() ||
                                        !lnameBox.validation()||
                                        !passBox.validation()||
                                        !confPassBox.validation())
                                      {
                                        return;
                                      }

                                   setState(() {
                                     fname = fnameBox.getInfo();
                                     lname = lnameBox.getInfo();
                                     pass = passBox.getInfo();
                                     confpass = confPassBox.getInfo();
                                   });
                                    if(pass != confpass)
                                    {
                                      PopUp(
                                          data: queryData,
                                          icon: Icons.error_outline,
                                          title: 'ERROR', message: 'Password '
                                          'and Confirm Password do not match',
                                          context: context);
                                      return;
                                    }
                                    Map sendData = {
                                      "fname":fname,
                                      "lname":lname,
                                      "pass" :pass
                                    };

                                    Navigator.of(context).push(MaterialPageRoute
                                      (
                                        builder:(context) => SignUp2(data:sendData),
                                      ));

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
                                  "NEXT",
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
      ),
    );
  }
}
