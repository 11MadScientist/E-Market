import 'package:flutter/material.dart';
import 'package:e_market/pages/login.dart';
import 'package:e_market/pages/signup.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/user_profile.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/'       : (context) => Landing(),
    '/login'  :(context) => Login(),
    '/signup' :(context) => SignUp(),
    '/home'   :(context) => Home(),
    '/profile':(context) => UserProfile()
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
