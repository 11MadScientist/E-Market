import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/services/profile_api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/traps/profile_trap.dart';
import 'package:e_market/designs/popup.dart';

class SignUp2 extends StatefulWidget {
  @override
  final Map data;

  SignUp2({this.data});
  _SignUp2State createState() => _SignUp2State();
}

class _SignUp2State extends State<SignUp2>{
  ProfileTrap trap = ProfileTrap();
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final ProfileAPIGateway apiGateway = ProfileAPIGateway();
  Profile _userProfile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.data["pass"]);
  }

  Future<Profile> _createProfile(Map data) async
  {
    Profile body = await apiGateway.asyncPost(data);
    setState(() {
      _userProfile =body;
    });
    return body;
  }
  Map data;

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
  final FocusNode node = FocusNode();

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
                                emailBox= new TextBox(
                                  hint: "Email Address",
                                  icon: Icons.email_outlined,
                                  type: TextInputType.emailAddress,
                                  controller: _emailController,
                                  node: node,
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
                                SizedBox(height: 20,),
                                TextButton(
                                  onPressed: ()async
                                  {
                                  //checking if an error exists in validation
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
                                        "firstname"  :widget.data["fname"],
                                        "lastname"   :widget.data["lname"],
                                        "password"   :widget.data["pass"],
                                        "email"      :email,
                                        "phonenumber":phoneNumber,
                                        "address"    :detailedAddress + " " + generalAddress,
                                        "usertype"   :"Buyer",

                                      } ;
                                    });

                                    _createProfile(data).then((value)
                                    {
                                      PopUp(
                                          data: queryData,
                                          icon: Icons.check_circle,
                                          title: 'SUCCESS',
                                          coloring: Colors.green,
                                          route: "/login",
                                          message:"${value.firstname} "
                                              "${value.lastname} using email "
                                              "${value.email} successfully registered "
                                              "at ${value.created_at}",
                                          context: context);

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
                                    "Finish",
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
