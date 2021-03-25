import 'package:flutter/material.dart';

class MyAppBar extends AppBar
{

  MyAppBar({Key key, double size, String screenName})
      :super(key: key, toolbarHeight: 100, title:
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