import 'package:e_market/designs/popup.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/services/profile_api_gateway.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'MyBottomNavigationBar.dart';

class ProfileSettings extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();

  Profile profile;
  ProfileSettings({this.profile});

}



class MapScreenState extends State<ProfileSettings>
    with SingleTickerProviderStateMixin {
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  TextEditingController f_nameController;
  TextEditingController l_nameController;
  TextEditingController _mobileController;
  TextEditingController _locationController;

  Profile _profile;
  MediaQueryData queryData;
  final ProfileAPIGateway profileAPIGateway = ProfileAPIGateway();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.profile.firstname);
    f_nameController = TextEditingController();
    f_nameController.text = widget.profile.firstname;

    l_nameController = TextEditingController();
    l_nameController.text = widget.profile.lastname;

    _mobileController = TextEditingController();
    _mobileController.text = widget.profile.phonenumber.toString();

    _locationController = TextEditingController();
    _locationController.text = widget.profile.address;
  }

  Future<void> editProfile(Map data)async
  {
    _profile = await profileAPIGateway.asyncPut(data);
  }

  @override
  Widget build(BuildContext context) {
    queryData = MediaQuery.of(context);
    return new Scaffold(
        body: new Container(
      color: Colors.white,
      child: new ListView(
        children: <Widget>[
          Column(
            children: <Widget>[
              new Container(
                height: 250.0,
                color: Colors.orange,
                child: new Column(
                  children: <Widget>[
                    Padding(
                        padding: EdgeInsets.only(left: 20.0, top: 20.0),
                        child: new Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new IconButton(
                              onPressed:()
                              {
                                if(_profile == null)
                                  {
                                    _profile = widget.profile;
                                  }
                                Navigator.of(context).pushReplacement(MaterialPageRoute
                                  (
                                  builder:(context) => MyBottomNavigationBar(
                                    profile: _profile,
                                    idx: 1,),
                                ));
                              },
                              icon:Icon(
                                Icons.arrow_back_outlined,
                                color: Colors.white,
                                size: 22.0,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 25.0),
                              child: new Text('EDIT PROFILE',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20.0,
                                      fontFamily: 'Poppins',
                                      color: Colors.white)),
                            )
                          ],
                        )),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: new Stack(fit: StackFit.loose, children: <Widget>[
                        new Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: new BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: new DecorationImage(
                                    image: new ExactAssetImage(
                                        'lib/assets/market.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: new Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                new CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 25.0,
                                  child: new Icon(
                                    Icons.camera_alt,
                                    color: Colors.orange,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              new Container(
                color: Color(0xffFFFFFF),
                child: Padding(
                  padding: EdgeInsets.only(bottom: 25.0),
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Personal Information',
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  _status ? _getEditIcon() : new Container(),
                                ],
                              )
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'First Name',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: f_nameController,
                                  decoration: const InputDecoration(
                                    hintText: "Name",
                                  ),
                                  enabled: !_status,
                                  autofocus: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Last Name',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: l_nameController,
                                  decoration: const InputDecoration(
                                      hintText: "name"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      //password
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  new Text(
                                    'Mobile',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              new Flexible(
                                child: new TextField(
                                  controller: _mobileController,
                                  decoration: const InputDecoration(
                                      hintText: "Mobile Number"),
                                  enabled: !_status,
                                ),
                              ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 25.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: new Text(
                                    'Location',
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                flex: 2,
                              ),
                              // Expanded(
                              //   child: Container(
                              //     child: new Text(
                              //       'Zipcode',
                              //       style: TextStyle(
                              //           fontFamily: 'Poppins',
                              //           fontSize: 16.0,
                              //           fontWeight: FontWeight.bold),
                              //     ),
                              //   ),
                              //   flex: 2,
                              // ),
                            ],
                          )),
                      Padding(
                          padding: EdgeInsets.only(
                              left: 25.0, right: 25.0, top: 2.0),
                          child: new Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Flexible(
                                child: Padding(
                                  padding: EdgeInsets.only(right: 10.0),
                                  child: new TextField(
                                    controller:_locationController,
                                    decoration: const InputDecoration(
                                        hintText: "Location"),
                                    enabled: !_status,
                                  ),
                                ),
                                flex: 2,
                              ),
                              // Flexible(
                              //   child: new TextField(
                              //     decoration: const InputDecoration(
                              //         hintText: "Zipcode"),
                              //     enabled: !_status,
                              //   ),
                              //   flex: 2,
                              // ),
                            ],
                          )),
                      !_status ? _getActionButtons() : new Container(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    ));
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myFocusNode.dispose();
    super.dispose();
  }

  Widget _getActionButtons() {
    return Padding(
      padding: EdgeInsets.only(left: 25.0, right: 25.0, top: 45.0),
      child: new Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Save",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                textColor: Colors.white,
                color: Colors.green,
                onPressed: () async{

                      // widget.profile.firstname =f_nameController.text.toString();
                      // widget.profile.lastname =l_nameController.text;
                      // widget.profile.address =_locationController.text;
                      // widget.profile.phonenumber = _mobileController.text;

                      Map userinfo = {
                    "id":widget.profile.id.toString(),
                    "firstname":f_nameController.text.toString(),
                    "lastname":l_nameController.text,
                    "password":widget.profile.password,
                    "email":widget.profile.email,
                    "address":_locationController.text,
                    "phonenumber":_mobileController.text,
                    "usertype":widget.profile.usertype,
                  };
                  print(userinfo);
                  await editProfile(userinfo).then((value)
                  {
                    print(_profile.lastname);
                    PopUp(
                        data: queryData,
                        icon: Icons.check_circle,
                        title: 'Success',
                        coloring: Colors.green,
                        message:"Quantity Changed Successfully",
                        context: context);
                    setState(() {
                      _status = true;
                      FocusScope.of(context).requestFocus(new FocusNode());
                    });
                  });

                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(left: 10.0),
              child: Container(
                  child: new RaisedButton(
                child: new Text(
                  "Cancel",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                  ),
                ),
                textColor: Colors.white,
                color: Colors.red,
                onPressed: () {
                  setState(() {
                    _status = true;
                    FocusScope.of(context).requestFocus(new FocusNode());
                  });
                },
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0)),
              )),
            ),
            flex: 2,
          ),
        ],
      ),
    );
  }

  Widget _getEditIcon() {
    return new GestureDetector(
      child: new CircleAvatar(
        backgroundColor: Colors.orange,
        radius: 14.0,
        child: new Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
