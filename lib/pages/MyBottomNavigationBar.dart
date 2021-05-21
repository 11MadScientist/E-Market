import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/cartpage.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/landing.dart';
import 'package:flutter/material.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
  final Profile profile;
  MyBottomNavigationBar({this.profile});
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  List<Widget> _routes;

  @override
  void initState() {
    super.initState();
    _routes = [
      Landing(),
      Home(profile: widget.profile),
      CartPage(profile: widget.profile),
    ];
  }

  int _currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _routes[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 50,
        color: Colors.orange[500],
        backgroundColor: Colors.white,
        items: <Widget>[
          Icon(Icons.delivery_dining, size:20,color: Colors.white),
          Icon(Icons.shopping_basket, size:20,color: Colors.white),
          Icon(Icons.shopping_cart_rounded, size:20,color: Colors.white),
        ],
        animationDuration: Duration(milliseconds: 850),
        animationCurve: Curves.linearToEaseOut,
        index: 1,
        onTap: (index)
        {
          setState(() {
            _currentIndex = index;
          });
        },

      ),
    );
  }
}
