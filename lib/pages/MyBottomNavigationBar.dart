import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/cartpage.dart';
import 'package:e_market/pages/home.dart';
import 'package:e_market/pages/landing.dart';
import 'package:e_market/pages/purchasedProducts.dart';
import 'package:flutter/material.dart';

import 'SellerStoreProducts.dart';

class MyBottomNavigationBar extends StatefulWidget {
  @override
  _MyBottomNavigationBarState createState() => _MyBottomNavigationBarState();
  final Profile profile;
  final int idx;
  MyBottomNavigationBar({this.profile, this.idx});
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  List<Widget> _routes;
  int _currentIndex = 1;
  @override
  void initState() {
    super.initState();
    if(widget.profile.usertype == "Seller")
      {
        _routes = [
          Purchased(profile: widget.profile),
          Home(profile: widget.profile),
          SellerStoreProduct(profile: widget.profile),
        ];
      }
    else
      {
        _routes = [
          Purchased(profile: widget.profile),
          Home(profile: widget.profile),
          CartPage(profile: widget.profile),
        ];
      }

    if(widget.idx != null)
      {
        setState(() {
          _currentIndex = widget.idx;
        });
      }
  }


  @override
  Widget build(BuildContext context) {
    if(widget.profile.usertype == "Seller")
      {
        return Scaffold(
          body: _routes[_currentIndex],
          bottomNavigationBar: CurvedNavigationBar(
            height: 50,
            color: Colors.orange[500],
            backgroundColor: Colors.white,
            items: <Widget>[
              Icon(Icons.view_list_outlined, size:20,color: Colors.white),
              Icon(Icons.shopping_basket, size:20,color: Colors.white),
              Icon(Icons.playlist_add_sharp, size:20,color: Colors.white),
            ],
            animationDuration: Duration(milliseconds: 850),
            animationCurve: Curves.linearToEaseOut,
            index: _currentIndex,
            onTap: (index)
            {
              setState(() {
                _currentIndex = index;
              });
            },

          ),
        );
      }
    else
      {
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
            index: _currentIndex,
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
}
