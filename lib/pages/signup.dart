import 'package:e_market/designs/passfield.dart';
import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:http/http.dart' as http;
import 'package:e_market/services/api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:e_market/model/profile.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

Future<Profile> createUser(Map data) async
{
  final String api = "http://emarket.hustle/api/userinfo";
  final response = await http.post(api,body:data);

  if(response.statusCode == 201)
    print("success");
  else
    print("failure");
}

class _SignUpState extends State<SignUp>{
final EnvEndPoints envEndPoints = EnvEndPoints();
final APIGateway apiGateway = APIGateway();

 bool isFirstPage = true;
 String buttonText = "NEXT";
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

 //second batch
  //email
  TextBox emailBox;
  TextEditingController _emailController = new TextEditingController();

  String email;

  //Phone number
  TextBox phoneNumBox;
  TextEditingController _phoneNumberController = new TextEditingController();

  String phoneNumber;

  //Address
  TextBox detailedAddressBox;
  TextEditingController _detailedAddressController = new TextEditingController();
  TextBox generalAddressBox;
  TextEditingController _generalAddressController = new TextEditingController();

  String detailedAddress;
  String generalAddress;




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
                            boxes(),
                            SizedBox(height: 20,),
                            TextButton(
                              onPressed: ()
                              {
                                setState(()
                                {
                                  if(isFirstPage)
                                    {
                                      buttonText = "FINISH";
                                      fname = fnameBox.getInfo();
                                      lname = lnameBox.getInfo();
                                      pass = passBox.getInfo();
                                      confpass = confPassBox.getInfo();
                                      isFirstPage = false;
                                    }
                                  else if(!isFirstPage)
                                    {
                                      email = emailBox.getInfo();
                                      phoneNumber = phoneNumBox.getInfo();
                                      detailedAddress = detailedAddressBox.getInfo();
                                      generalAddress = generalAddressBox.getInfo();

                                      Map data ={
                                        "firstname"  :fname,
                                        "lastname"   :lname,
                                        "password"   :pass,
                                        "email"      :email,
                                        "phonenumber":phoneNumber,
                                        "address"    :detailedAddress + " " + generalAddress,
                                        "usertype"   :"Buyer",

                                      } ;

                                     apiGateway.asyncPost(data);
                                    }

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
                                buttonText,
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

  Widget boxes()
  {
    if(isFirstPage)
      {
        return
            Column(
              children: [
                fnameBox = new TextBox(
                  hint: "First Name",
                  icon: Icons.account_circle,
                  type: TextInputType.text,
                  controller: f_nameController,
                ),
                SizedBox(height: 20,),
                lnameBox = new TextBox(
                  hint: "Last Name",
                  icon: Icons.account_circle,
                  type: TextInputType.text,
                  controller: l_nameController,
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
              ],
            );
      }
    else
      {
        return
          Column(
            children: [
              emailBox= new TextBox(
                hint: "Email Address",
                icon: Icons.email_outlined,
                type: TextInputType.emailAddress,
                controller: _emailController,
              ),
              SizedBox(height: 20,),
              phoneNumBox = new TextBox(
                hint: "Phone Number",
                icon: Icons.phone,
                type: TextInputType.number,
                controller: _phoneNumberController,
              ),
              SizedBox(height: 20,),
              detailedAddressBox = new TextBox(
                hint: "house number, street name",
                icon: Icons.location_city,
                type: TextInputType.text,
                controller: _detailedAddressController,
              ),
              SizedBox(height: 20,),
              generalAddressBox = new TextBox(
                hint: "Barangay, City, Province",
                icon: Icons.location_on,
                type: TextInputType.text,
                controller: _generalAddressController,
              ),
            ],
          );
      }
  }
}
