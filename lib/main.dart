import 'package:flutter/material.dart';
import 'package:e_market/pages/home.dart';

void main() => runApp(MaterialApp(
      // THEMING
      theme: ThemeData(
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
            displayColor: Colors.white,
          )),
      home: home(),
    ));
