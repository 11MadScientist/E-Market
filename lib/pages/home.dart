import 'package:flutter/material.dart';
import 'package:e_market/designs/appbar.dart';
import 'package:e_market/designs/categorycard.dart';
import 'package:e_market/designs/sellershomecard.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isBuyer = false;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: MyAppBar(
          size: queryData.size.width,
          screenName: "Home",
          context: this.context,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 15.0),
                      height: 85,
                      width: queryData.size.width,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          CategoryCard(
                            col: Colors.orange,
                            category: "meat",
                          ),
                          CategoryCard(
                            col: Colors.orange,
                            category: "meat",
                          ),
                          CategoryCard(
                            col: Colors.orange,
                            category: "meat",
                          ),
                          CategoryCard(
                            col: Colors.orange,
                            category: "meat",
                          ),
                          CategoryCard(
                            col: Colors.orange,
                            category: "meat",
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Visibility(
                  visible: false,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Text(
                                "Stores Nearby You",
                                style: TextStyle(
                                  fontSize: 17,
                                ),
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 174,
                                    height: 214,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.orange,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 80,
                                            // decoration: BoxDecoration(color: Colors.black),
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.orange[100],
                                              child: Text(
                                                "TS",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              radius: 30,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Tommy Store",
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Basak, Lapu-Lapu City",
                                                        style: TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                              fontSize: 15,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color: Colors.orange,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 174,
                                    height: 214,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.orange,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 80,
                                            // decoration: BoxDecoration(color: Colors.black),
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.orange[100],
                                              child: Text(
                                                "TS",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              radius: 30,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Tommy Store",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Basak, Lapu-Lapu City",
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              color:
                                                                  Colors.white,
                                                              // fontWeight: FontWeight.bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color: Colors.orange,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Container(
                                    width: 174,
                                    height: 214,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                      color: Colors.orange,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              Icon(
                                                Icons.favorite_border,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ],
                                          ),
                                          Container(
                                            height: 80,
                                            // decoration: BoxDecoration(color: Colors.black),
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.orange[100],
                                              child: Text(
                                                "TS",
                                                style: TextStyle(
                                                  fontFamily: "Poppins",
                                                  color: Colors.orange,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                              ),
                                              radius: 30,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 13,
                                          ),
                                          Text(
                                            "Tommy Store",
                                            style: TextStyle(
                                              fontFamily: "Poppins",
                                              color: Colors.white,
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Container(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        "Basak, Lapu-Lapu City",
                                                        style: TextStyle(
                                                          fontFamily: "Poppins",
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            "4.5",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  "Poppins",
                                                              color:
                                                                  Colors.white,
                                                              // fontWeight: FontWeight.bold,
                                                              fontSize: 15,
                                                            ),
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color: Colors.white,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Stack(
                                                    alignment: Alignment.center,
                                                    children: [
                                                      Icon(
                                                        Icons.circle,
                                                        color: Colors.white,
                                                        size: 30,
                                                      ),
                                                      Icon(
                                                        Icons.chevron_right,
                                                        color: Colors.orange,
                                                        size: 20,
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Best Selling Products",
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Poppins",
                              color: Colors.blue[900],
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                    width: 250,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/recommend.jpg'),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Spices",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "Poppins",
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Herbs and Spices',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Text(
                                                  'Tommy Store',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'P 10.58/kl',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily: "Poppins",
                                                          color:
                                                              Colors.blue[900],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.blue[900],
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 250,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/recommend.jpg'),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Spices",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "Poppins",
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Herbs and Spices',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Text(
                                                  'Tommy Store',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'P 10.58/kl',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily: "Poppins",
                                                          color:
                                                              Colors.blue[900],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.blue[900],
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                                Container(
                                    width: 250,
                                    height: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsets.all(15),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20.0),
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                      'lib/assets/recommend.jpg'),
                                                  fit: BoxFit.cover,
                                                )),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        "Spices",
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontFamily: "Poppins",
                                                          color: Colors.black45,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.favorite,
                                                      color: Colors.red,
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 5,
                                                ),
                                                Text(
                                                  'Herbs and Spices',
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Text(
                                                  'Tommy Store',
                                                  style: TextStyle(
                                                    fontSize: 10,
                                                    fontFamily: "Poppins",
                                                    color: Colors.blue[900],
                                                  ),
                                                ),
                                                Row(
                                                  children: [
                                                    Expanded(
                                                      child: Text(
                                                        'P 10.58/kl',
                                                        style: TextStyle(
                                                          fontSize: 17,
                                                          fontFamily: "Poppins",
                                                          color:
                                                              Colors.blue[900],
                                                        ),
                                                      ),
                                                    ),
                                                    Icon(
                                                      Icons.chevron_right,
                                                      color: Colors.blue[900],
                                                      size: 20,
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Best Seller Products',
                        style: TextStyle(
                          fontSize: 17,
                        ),
                      ),
                      SellerCard(),
                      SellerCard(),
                      SellerCard(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    bottomNavigationBar: CurvedNavigationBar(
      height: 50,
      color: Colors.orange[500],
      backgroundColor: Colors.white,
      items: <Widget>[
        Icon(Icons.home, size:20,color: Colors.white),
        Icon(Icons.shopping_basket, size:20,color: Colors.white),
        Icon(Icons.home, size:20,color: Colors.white),
    ],
      animationDuration: Duration(milliseconds: 250),
      animationCurve: Curves.linearToEaseOut,
      index: 1,
      onTap: (index)
      {
        print("$index");
      },

    ));

  }
}
