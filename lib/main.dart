import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/cart.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/cart',
  routes: {
    '/': (context) => Landing(),
    '/login': (context) => Login(),
    '/signup': (context) => SignUp(),
    '/home': (context) => Home(),
    '/cart': (context) => Cart(),
  },
));