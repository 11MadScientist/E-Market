import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/item_description.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/item_desc',
  routes: {
    '/': (context) => Landing(),
    '/login': (context) => Login(),
    '/signup': (context) => SignUp(),
    '/home': (context) => Home(),
    '/item_desc': (context) => ItemDescription(),
  },
));