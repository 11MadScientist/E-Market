import 'package:e_market/model/Order.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/MyBottomNavigationBar.dart';
import 'package:e_market/services/order_api_gateway.dart';
import 'package:flutter/material.dart';

class ConfirmPopup {
  final MediaQueryData data;
  final BuildContext context;
  final String transactionID;
  final String usertype;
  final Order order;
  final Profile profile;
  final OrderAPIGateway orderAPIGateway = OrderAPIGateway();

  ConfirmPopup({
    this.data,
    this.context,
    this.transactionID,
    this.usertype,
    this.order,
    this.profile,
  }) {
    displayPopup(data);
  }

  Future<void> editOrder(Map data)async
  {
    await orderAPIGateway.asyncPut(data);
  }

  Future displayPopup(MediaQueryData data) async {
    if(order.orderStatus == "Declined" ||order.orderStatus == "Accepted")
      {
        return;
      }
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              bool isSeller = true;
              String buttonText = 'Decline';
              if (this.usertype == 'Buyer') {
                setState(() {
                  isSeller = false;
                  buttonText = 'Cancel';
                });
              }
              return Container(
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Confirmation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Transaction ID: ' + transactionID),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: data.size.width * .4,
                            child: ElevatedButton(
                                onPressed: ()
                                {
                                  Map orderinfo = {
                                    "id":order.id.toString(),
                                    "acc_id": order.accId.toString(),
                                    "store_id": order.storeId.toString(),
                                    "prod_id": order.prodId.toString(),
                                    "quantity": order.quantity.toString(),
                                    "prod_price": order.prodPrice.toString(),
                                    "transaction_id": order.transactionId.toString(),
                                    "total": order.total.toString(),
                                    "order_status": "Declined",
                                  };
                                  editOrder(orderinfo).then((value)
                                  {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute
                                      (
                                      builder:(context) => MyBottomNavigationBar(
                                        profile: profile,
                                        idx: 0,),
                                    ));
                                  });
                                },
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Text(buttonText),
                            ),
                          ),
                          Visibility(
                            visible: isSeller,
                            child: SizedBox(
                              width: data.size.width * .4,
                              child: ElevatedButton(
                                onPressed: ()
                                {
                                  Map orderinfo = {
                                    "id":order.id.toString(),
                                    "acc_id": order.accId.toString(),
                                    "store_id": order.storeId.toString(),
                                    "prod_id": order.prodId.toString(),
                                    "quantity": order.quantity.toString(),
                                    "prod_price": order.prodPrice.toString(),
                                    "transaction_id": order.transactionId.toString(),
                                    "total": order.total.toString(),
                                    "order_status": "Accepted",
                                  };
                                  editOrder(orderinfo).then((value)
                                  {
                                    Navigator.of(context).pushReplacement(MaterialPageRoute
                                      (
                                      builder:(context) => MyBottomNavigationBar(
                                        profile: profile,
                                        idx: 0,),
                                    ));
                                  });
                                },
                                style: ButtonStyle(
                                  elevation: MaterialStateProperty.all(0),
                                  foregroundColor:
                                      MaterialStateProperty.all(Colors.white),
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.green[600]),
                                ),
                                child: Text('Accept'),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        });
  }
}
