import 'package:flutter/material.dart';
import 'package:e_market/designs/appbar.dart';

class ProfileSettings extends StatefulWidget {
  ProfileSettings({Key key}) : super(key: key);

  @override
  _ProfileSettingsState createState() => _ProfileSettingsState();
}

class _ProfileSettingsState extends State<ProfileSettings> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
    resizeToAvoidBottomInset: true,
        appBar: MyAppBar(size: queryData.size.width, screenName: "Profile Settings",),
        body: SingleChildScrollView(
          child: Stack(children: <Widget>[
            Positioned(
           
              child: Container(
                   width: 250,  
              height: 250,
              decoration: BoxDecoration(
                 image: DecorationImage(
                      image: AssetImage("lib/assests/market.jpeg"),                    
                  ),
              )
              ,))
          ],),
        )
    );
  }
}