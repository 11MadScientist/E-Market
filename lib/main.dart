import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Login(),
    '/signup': (context) => SignUp(),
  },
));