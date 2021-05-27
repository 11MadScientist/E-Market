import 'package:e_market/designs/bestsellingcard.dart';
import 'package:e_market/designs/nearbystorescard.dart';
import 'package:e_market/designs/noproductfount.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/services/product_api_gateway.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/appbar.dart';
import 'package:e_market/designs/categorycard.dart';
import 'package:e_market/designs/productlist.dart';
import 'package:e_market/model/Product.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_session/flutter_session.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
  final Profile profile;
  Home({this.profile});
}

class _HomeState extends State<Home> {
  final ProductAPIGateway apiGateway = ProductAPIGateway();
  Future<List<Product>> _products;
  bool isBuyer = false;

  void _session() async {
    if (widget.profile.usertype == "Seller") {
      setState(() {
        isBuyer = false;
        _products = apiGateway.storeProductsGet(widget.profile.id);
      });
    } else {
      setState(() {
        isBuyer = true;
        _products = apiGateway.asyncListGet();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _session();
  }


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "Home",
        context: this.context,
        profile: widget.profile,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isBuyer,
                child: Column(
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
                      child: Center(
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          children: [
                            CategoryCard(
                              col: Colors.grey[200],
                              category: "All",
                              img: 'allCategory.png',
                            ),
                            CategoryCard(
                              col: Colors.grey[200],
                              category: "Meat",
                              img: 'porkCategory.png',
                            ),
                            CategoryCard(
                              col: Colors.grey[200],
                              category: "Chicken",
                              img: "chickenCategory.png",
                            ),
                            CategoryCard(
                              col: Colors.grey[200],
                              category: "Fish",
                              img: 'fishCategory.png',
                            ),
                            CategoryCard(
                              col: Colors.grey[200],
                              category: "Vegetables",
                              img: "vegetableCategory.png",
                            ),
                            CategoryCard(
                              col: Colors.white54,
                              category: "Spices",
                              img: "spice.png",
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isBuyer,
                child: Column(
                  children: [
                    Visibility(
                      visible: true,
                      child: Padding(
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
                                  NearbyStoresCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  NearbyStoresCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  NearbyStoresCard(),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                              BestSellingCard(),
                              BestSellingCard(),
                              BestSellingCard(),
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
                      'Product List',
                      style: TextStyle(
                        fontSize: 17,
                      ),
                    ),
                    FutureBuilder(
                        future: _products,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Product>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              padding: EdgeInsets.all(400),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          } else if (snapshot.hasError) {
                            final error = snapshot.error;
                            return Text(error.toString());
                          }
                          else if (snapshot.hasData) {
                            if (snapshot.data.length == 0) {
                              return NoProduct(
                                data: queryData,
                              );
                            }
                            return SizedBox(
                              height: queryData.size.height*.72,
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: snapshot.data.length,
                                itemBuilder: (context, index) {
                                  return ProductList(
                                      product: snapshot.data[index],
                                      profile: widget.profile,
                                      );
                                },
                              ),
                            );
                          } else {
                            return Text("No Profile Found");
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // bottomNavigationBar: CurvedNavigationBar(
      //   height: 50,
      //   color: Colors.orange[500],
      //   backgroundColor: Colors.white,
      //   items: <Widget>[
      //     Icon(Icons.home, size:20,color: Colors.white),
      //     Icon(Icons.shopping_basket, size:20,color: Colors.white),
      //     Icon(Icons.home, size:20,color: Colors.white),
      // ],
      //   animationDuration: Duration(milliseconds: 250),
      //   animationCurve: Curves.linearToEaseOut,
      //   index: 1,
      //   onTap: (index)
      //   {
      //     print("$index");
      //   },
      //
      // )
    );

  }
}
