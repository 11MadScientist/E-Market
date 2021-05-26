import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/signup2.dart';
import 'package:e_market/pages/signup3.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/user_profile.dart';
import 'package:e_market/pages/cartpage.dart';
import 'package:e_market/pages/MyBottomNavigationBar.dart';
import 'package:e_market/pages/item_description.dart';
import 'package:e_market/pages/SellerStoreProducts.dart';
import 'package:e_market/pages/purchasedProducts.dart';

void main() => runApp(MaterialApp(
      // THEMING
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: Colors.orange,
          fontFamily: 'Poppins',
          appBarTheme: AppBarTheme(
            foregroundColor: Colors.white,
            backwardsCompatibility: false,
          ),
          textTheme: TextTheme(
            bodyText1: TextStyle(),
            bodyText2: TextStyle(),
          ).apply(
            bodyColor: Colors.blue[900],
            displayColor: Colors.blue[900],
          )),
      // initialRoute: '/login',
  initialRoute: '/seller_store',
      routes: {
        '/nav': (context) => MyBottomNavigationBar(),
        '/login': (context) => Login(),
        '/landing': (context) => Landing(),
        '/signup': (context) => SignUp(),
        '/signup2': (context) => SignUp2(),
        '/signup3': (context) => SignUp3(),
        '/home': (context) => Home(),
        '/profile': (context) => UserProfile(),
        '/cart': (context) => CartPage(),
        '/item_desc': (context) => ItemDescription(),
        '/seller_store': (context) => SellerStoreProduct(),
        '/purchasing_page': (context) => Purchased(),
      },
    ));
