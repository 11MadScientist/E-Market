import 'package:e_market/designs/passfield.dart';
import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/services/api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/traps/profile_trap.dart';
import 'package:e_market/designs/popup.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp>{
final EnvEndPoints envEndPoints = EnvEndPoints();
final APIGateway apiGateway = APIGateway();
Future<Profile> _userProfile;

void _createProfile(Map data) async
{
  setState(() {
    _userProfile = apiGateway.asyncPost(data);
  });

}

 bool isFirstPage = true;
 String buttonText = "NEXT";
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

  //Focusnodes
  final FocusNode node0 = FocusNode();
  final FocusNode node1 = FocusNode();
  final FocusNode node2 = FocusNode();
  final FocusNode node3 = FocusNode();

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
                              boxes(),
                              SizedBox(height: 20,),
                              TextButton(
                                onPressed: ()async
                                {
                                //checking if an error exists in validation
                                if(isFirstPage)
                                  {
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
                                    setState(() {
                                      isFirstPage = false;
                                      buttonText = "FINISH";
                                    });

                                  }
                                else if(!isFirstPage)
                                  {
                                    print("hello");
                                    await emailBox.validator();
                                    await emailBox.verify();
                                    await phoneNumBox.validator();
                                    await detailedAddressBox.validator();
                                    await generalAddressBox.validator();
                                    print(emailBox.validation());

                                    if(!emailBox.validation() ||
                                        !phoneNumBox.validation() ||
                                        !detailedAddressBox.validation() ||
                                        !generalAddressBox.validation())
                                    {
                                      print("hi");

                                      return;
                                    }

                                   setState(() {
                                     email = emailBox.getInfo();
                                     phoneNumber = phoneNumBox.getInfo();
                                     detailedAddress = detailedAddressBox.getInfo();
                                     generalAddress = generalAddressBox.getInfo();

                                     data ={
                                       "firstname"  :fname,
                                       "lastname"   :lname,
                                       "password"   :pass,
                                       "email"      :email,
                                       "phonenumber":phoneNumber,
                                       "address"    :detailedAddress + " " + generalAddress,
                                       "usertype"   :"Buyer",

                                     } ;
                                   });

                                    _createProfile(data);
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
      ),
    );
  }


  Widget boxes()
  {
    ProfileTrap trap = ProfileTrap();
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
                node: node0,
                func_a: trap.emailTrap,
                func_b: trap.emailCheck,
              ),
              SizedBox(height: 20,),
              phoneNumBox = new TextBox(
                hint: "Phone Number",
                icon: Icons.phone,
                type: TextInputType.number,
                controller: _phoneNumberController,
                func_a: trap.phoneNumberTrap,
              ),
              SizedBox(height: 20,),
              detailedAddressBox = new TextBox(
                hint: "house number, street name",
                icon: Icons.location_city,
                type: TextInputType.text,
                controller: _detailedAddressController,
                func_a: trap.defaultTrap,
              ),
              SizedBox(height: 20,),
              generalAddressBox = new TextBox(
                hint: "Barangay, City, Province",
                icon: Icons.location_on,
                type: TextInputType.text,
                controller: _generalAddressController,
                func_a: trap.defaultTrap,
              ),
            ],
          );
      }
  }
}
