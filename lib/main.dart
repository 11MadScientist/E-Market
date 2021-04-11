import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/cart.dart';
import 'package:e_market/pages/productList_seller.dart';

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
      home: product(),
    ));
