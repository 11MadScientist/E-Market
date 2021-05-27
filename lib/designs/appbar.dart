import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/profile-settings.dart';
import 'package:flutter/material.dart';

class MyAppBar extends AppBar
{
  final Profile profile;

  MyAppBar({Key key, double size, String screenName, BuildContext context, this.profile})
      :super(key: key, toolbarHeight: 100, backgroundColor: Colors.orange[500],
    title:
  Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      SizedBox(height: 20),
      Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                style: TextStyle(
                  decorationColor: Colors.orange,
                ),
                decoration: InputDecoration(
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                  fillColor: Colors.white,
                  filled: true,
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.orange)),
                )),
          ),
          SizedBox(width: size * .15,),
          IconButton(
            icon: Icon(Icons.account_circle,
            color: Colors.white,),
            onPressed: ()
            {
              Navigator.of(context).pushReplacement(MaterialPageRoute
                (
                builder:(context) => ProfileSettings(
                  profile: profile,
                  ),
              ));
            },
          ),
          IconButton(
            icon: Icon(Icons.notifications,
              color: Colors.white,),
            onPressed: ()
            {

            },
          ),
        ],
      ),
      SizedBox(height: 10),
      Text(
        screenName,
        style: TextStyle(
          fontSize: 20,
          // fontFamily: "Poppins",
          fontWeight: FontWeight.bold,
        ),
      ),
      SizedBox(height: 10)
    ],
  ),
  );
}