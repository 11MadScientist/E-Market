import "package:e_market/designs/appbar.dart";
import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/productcard.dart';

class Cart extends StatefulWidget {
  @override
  final Profile profile;

  Cart({this.profile});

  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  List<bool> isSelected = [false, false, false];
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "Cart",
      ),
      body: SingleChildScrollView(
        child: Container(
          width: queryData.size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //CART ITEM LIST
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    //1 PRODUCT
                    ProductListCard(
                        imageData: 'assets/images/meat.png',
                        productName: 'Meat',
                        price: 'P200/kl'),
                    ProductListCard(
                        imageData: 'assets/images/meat.png',
                        productName: 'Chicken',
                        price: 'P100/kl'),
                  ]),
                ),
                //DELIVERY ADDRESS SECTION
                Container(
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Delivery Address',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ),
                          //PAGE BUTTON FOR LOCATION SELECTOR
                          IconButton(
                            icon: Icon(
                              Icons.chevron_right_rounded,
                              color: Colors.blue[900],
                            ),
                          ),
                        ],
                      ),
                      //DELIVERY ADDRESS
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.orange,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                child: Icon(
                                  Icons.location_on_rounded,
                                  color: Colors.white,
                                ),
                              ),
                              Flexible(
                                child: Text(
                                  "Lot 5 Block 31, Aurton St. Suba-Masulog, Basak, Lapu-Lapu City, 6015, Philippines",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                //MOP
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //LABEL MODE OF PAYMENT
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                        child: Text(
                          "Mode of Payment",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            //COD MOP
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: queryData.size.width * .5,
                                //COD BUTTON
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        isSelected[0]
                                            ? Colors.white
                                            : Colors.blue[900]),
                                    backgroundColor: MaterialStateProperty.all(
                                        isSelected[0]
                                            ? Colors.orange
                                            : Colors.white),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.orange),
                                    )),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  //ICON FOR COD
                                  icon: Icon(
                                    Icons.payments,
                                  ),
                                  label: Text(
                                    "Cash on Delivery",
                                  ),
                                  //OTHER BUTTONS DESELECTED WHEN THIS BUTTON IS SELECTED
                                  onPressed: () {
                                    setState(() {
                                      for (int index = 0;
                                          index < isSelected.length;
                                          index++) {
                                        if (0 == index) {
                                          isSelected[index] = true;
                                        } else {
                                          isSelected[index] = false;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            //CREDIT MOP
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: queryData.size.width * .5,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        isSelected[1]
                                            ? Colors.white
                                            : Colors.blue[900]),
                                    backgroundColor: MaterialStateProperty.all(
                                        isSelected[1]
                                            ? Colors.orange
                                            : Colors.white),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.orange),
                                    )),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  //ICON FOR CREDIT CARD
                                  icon: Icon(
                                    Icons.payment,
                                  ),
                                  label: Text(
                                    "Credit Card",
                                  ),
                                  //OTHER BUTTONS DESELECTED WHEN THIS BUTTON IS SELECTED
                                  onPressed: () {
                                    setState(() {
                                      for (int index = 0;
                                          index < isSelected.length;
                                          index++) {
                                        if (1 == index) {
                                          isSelected[index] = true;
                                        } else {
                                          isSelected[index] = false;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                            //ONLINE MOP
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                              child: Container(
                                height: 50,
                                width: queryData.size.width * .5,
                                child: ElevatedButton.icon(
                                  style: ButtonStyle(
                                    foregroundColor: MaterialStateProperty.all(
                                        isSelected[2]
                                            ? Colors.white
                                            : Colors.blue[900]),
                                    backgroundColor: MaterialStateProperty.all(
                                        isSelected[2]
                                            ? Colors.orange
                                            : Colors.white),
                                    shape: MaterialStateProperty.all(
                                        RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                      side: BorderSide(color: Colors.orange),
                                    )),
                                    elevation: MaterialStateProperty.all(0),
                                  ),
                                  //ICON FOR ONLINE PAYMENT
                                  icon: Icon(Icons.attach_money_outlined),
                                  label: Text(
                                    "Online Payment",
                                  ),
                                  //OTHER BUTTONS DESELECTED WHEN THIS BUTTON IS SELECTED
                                  onPressed: () {
                                    setState(() {
                                      for (int index = 0;
                                          index < isSelected.length;
                                          index++) {
                                        if (2 == index) {
                                          isSelected[index] = true;
                                        } else {
                                          isSelected[index] = false;
                                        }
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //TOTAL SECTION
                Container(
                  padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                  child: Column(
                    children: [
                      //SUBTOTAL
                      Row(
                        children: [
                          Expanded(
                            child: Text("Subtotal:"),
                          ),
                          Text("P500.00"),
                        ],
                      ),
                      //DELIVERY FEE
                      Row(
                        children: [
                          Expanded(
                            child: Text("Delivery Fee:"),
                          ),
                          Text("P50.00"),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "Total: ",
                              style: TextStyle(
                                fontSize: 17,
                              ),
                            ),
                          ),
                          Text(
                            "P550.00",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 17,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 50,
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.orange),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                      elevation: MaterialStateProperty.all(0),
                    ),
                    child: Text(
                      "Checkout",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
