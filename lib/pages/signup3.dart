import 'package:e_market/model/profile.dart';
import 'package:e_market/model/store.dart';
import 'package:e_market/services/profile_api_gateway.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/myclipper.dart';
import 'package:e_market/designs/textbox.dart';
import 'package:e_market/services/store_api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:e_market/traps/profile_trap.dart';
import 'package:e_market/designs/popup.dart';

class SignUp3 extends StatefulWidget {
  @override
  final Map data;

  SignUp3({this.data});
  _SignUp3State createState() => _SignUp3State();
}

class _SignUp3State extends State<SignUp3>{
  ProfileTrap trap = ProfileTrap();
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final ProfileAPIGateway apiGateway = ProfileAPIGateway();
  final StoreAPIGateway storeAPIGateway = StoreAPIGateway();

  Profile _userProfile;
  Store _storeInfo;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //print(widget.data["pass"]);
    //print(widget.data["userType"]);
  }

  Future<Profile> _createProfile(Map data) async
  {
    Profile body = await apiGateway.asyncPost(data);
    setState(() {
      _userProfile = body;
    });
      print(_userProfile.id);
    return body;
  }

  Future <Store> _createStore(Map data) async
  {
    Store body = await storeAPIGateway.asyncPost(data);
    setState(() {
      _storeInfo = body;
    });
      return body;

  }
  Map userProfileData;
  Map storeData;

  //Store name
  TextBox storeNameBox;
  TextEditingController _storeNameController = new TextEditingController();
  String storeName;

  //Address
  TextBox storeAddressBox;
  TextEditingController _storeAddressController = new TextEditingController();
  String storeAddress;

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
                                storeAddressBox = new TextBox(
                                  hint: "Store address (Barangay, City, Province)",
                                  icon: Icons.location_on,
                                  type: TextInputType.text,
                                  controller: _storeAddressController,
                                  func_a: trap.defaultTrap,
                                ),
                                SizedBox(height: 20,),

                                storeNameBox = new TextBox(
                                  hint: "Store name",
                                  icon: Icons.storefront,
                                  type: TextInputType.text,
                                  controller: _storeNameController,
                                  func_a: trap.defaultTrap,
                                ),
                                SizedBox(height: 20,),
                                TextButton(
                                  onPressed: ()async
                                  {
                                    //checking if an error exists in validation
                                    print("hello");
                                    await storeAddressBox.validator();

                                    if(!storeAddressBox.validation())
                                    {
                                      print("hi");
                                      return;
                                    }

                                    setState(() {
                                      storeName = storeNameBox.getInfo();
                                      storeAddress = storeAddressBox.getInfo();

                                      userProfileData ={
                                        "firstname"  :widget.data["firstname"],
                                        "lastname"   :widget.data["lastname"],
                                        "password"   :widget.data["password"],
                                        "email"      :widget.data["email"],
                                        "phonenumber":widget.data["phonenumber"],
                                        "address"    :widget.data["address"],
                                        "usertype"   :widget.data["usertype"],
                                      };
                                    });
                                    _createProfile
                                    (userProfileData).then((value)
                                    {
                                      setState(() {
                                        print(_userProfile.id);
                                        storeData = {
                                          "acc_id"        : _userProfile.id.toString(),
                                          "store_name"    : storeName,
                                          "store_location": storeAddress,
                                        };
                                      });

                                      print(storeData);
                                      _createStore(storeData);
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

                                    print(storeName);
                                    print(storeAddress);
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
