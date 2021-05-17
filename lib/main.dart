import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_market/designs/MyBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/signup2.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/user_profile.dart';
import 'package:e_market/pages/cart.dart';
import 'package:e_market/pages/item_description.dart';

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
      initialRoute: '/login',
      routes: {
        '/': (context) => Landing(),
        '/nav':(context) =>MyBottomNavigationBar(),
        '/login': (context) => Login(),
        '/signup': (context) => SignUp(),
        '/signup2':(context) => SignUp2(),
        '/home': (context) => Home(),
        '/profile': (context) => UserProfile(),
        '/cart': (context) => Cart(),
        '/item_desc': (context) => ItemDescription(),
      },
    ));


// void main()
// {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       home: MyStatelessWidget(),
//     );
//   }
// }
//
// class MyStatelessWidget extends StatelessWidget
// {
//   const MyStatelessWidget({Key key}) : super(key:key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Emarket'),
//       ),
//       body: Center(child: Text('Press the button below!'),),
//       floatingActionButton: FloatingActionButton(
//         onPressed: ()
//         {
//           Navigator.push(context, MaterialPageRoute(builder: (context)=>UserProfile()));
//         },
//         child: Icon(Icons.navigation),
//         backgroundColor: Colors.green,
//
//       ),
//     );
//   }
// }
