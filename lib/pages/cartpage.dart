import "package:e_market/designs/appbar.dart";
import 'package:e_market/model/profile.dart';
import 'package:e_market/services/cart_api_gateway.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/cartlistcard.dart';
import 'package:e_market/model/Cart.dart';

class CartPage extends StatefulWidget {
  @override
  final Profile profile;

  CartPage({this.profile});

  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<bool> isSelected = [false, false, false];
  double subtotal = 0;
  final double deliveryfee = 50.00;

  final CartAPIGateway apiGateway = CartAPIGateway();
  Future<List<Cart>> _cart;
  bool isBuyer = false;


  void _session() async
  {
    setState((){
      _cart = apiGateway.asyncListGet();
    });
    _cart.then((value)
    {
      for(int i = 0; i<value.length; i++)
        {
          subtotal += value[i].total;
        }
      subtotal = double.parse(subtotal.toStringAsFixed(3));
      print("subtotal: $subtotal");
    });
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
                  child:  FutureBuilder(
                      future: _cart,
                      builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot)
                      {
                        if (snapshot.connectionState == ConnectionState.waiting)
                        {
                          return Container(
                            padding: EdgeInsets.all(400),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        else if(snapshot.hasError)
                        {
                          final error = snapshot.error;
                          return Text(error.toString());
                        }
                        else if(snapshot.hasData)
                        {
                          return SizedBox(
                            width: queryData.size.width,
                            height: 228,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index)
                              {
                                return CartListCard(cart:snapshot.data[index]);
                              },
                            ),
                          );
                        }
                        return Text("No Profile Found");

                      }),
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
                                  widget.profile.address,
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
                  child: FutureBuilder(
                      future: _cart,
                      builder: (BuildContext context, AsyncSnapshot<List<Cart>> snapshot)
                      {
                        if (snapshot.connectionState == ConnectionState.waiting)
                        {
                          return Container(
                            padding: EdgeInsets.all(400),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        else if(snapshot.hasError)
                        {
                          final error = snapshot.error;
                          return Text(error.toString());
                        }
                        else if(snapshot.hasData)
                        {
                          return Column(
                            children: [
                              //SUBTOTAL
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Subtotal:"),
                                  ),
                                  Text(subtotal.toStringAsFixed(2)),
                                ],
                              ),
                              //DELIVERY FEE
                              Row(
                                children: [
                                  Expanded(
                                    child: Text("Delivery Fee:"),
                                  ),
                                  Text(deliveryfee.toStringAsFixed(2)),
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
                                    (subtotal + deliveryfee).toStringAsFixed(2),
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        }
                        return Text("No Profile Found");

                      }),
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
