import 'package:e_market/designs/purchaselist.dart';
import 'package:e_market/model/MyTransactions.dart';
import 'package:e_market/model/Order.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/services/mytransactions_api_gateway.dart';
import 'package:e_market/services/order_api_gateway.dart';
import 'package:flutter/material.dart';
import "package:e_market/designs/appbar.dart";

class Purchased extends StatefulWidget {
  final Profile profile;

  Purchased({this.profile});
  @override
  _puchasedProduct createState() => _puchasedProduct();
}

class _puchasedProduct extends State<Purchased> {
  final OrderAPIGateway orderAPIGateway = OrderAPIGateway();
  final MyTransactionsAPIGateway transactionsAPIGateway = MyTransactionsAPIGateway();
  Future<List<Order>> orders;
  Future<List<MyTransactions>> transaction;
  // List<String> dataRows;

  void _session() async {
    print("id: ${widget.profile.id}");
    if(widget.profile.usertype == "Seller")
      {
        orders = orderAPIGateway.asyncListGetSeller(widget.profile.id);
      }
    else
      {
        transaction = transactionsAPIGateway.asyncListGet(widget.profile.id);
      }
    // setState(() {
    //   dataRows = new List.generate(5, (index) => null);
    // });
  }

  @override
  void initState() {
    super.initState();
    _session();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    //LIST FOR PURCHASED PRODUCT
    _session();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "Purchase",
      ),
      body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: queryData.size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: Colors.orange,
                )),
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Column(children: [
                  Container(
                    width: double.infinity,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "TRANSACTION ID",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "ORDER TOTAL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "STATUS",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: queryData.size.height * .85,
                    child: FutureBuilder(
                        future: orders,
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Order>> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Container(
                              padding: EdgeInsets.all(400),
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            );
                          }
                          else if (snapshot.hasError) {
                            final error = snapshot.error;
                            return Text(error.toString());
                          }
                          else if (snapshot.hasData) {
                            print(snapshot.data.length);
                            return ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: snapshot.data.length,
                              itemBuilder: (context, index)
                              {
                                print(snapshot.data[index]);
                                return PurchaseList(
                                    order:snapshot.data[index],
                                    profile: widget.profile,
                                );
                              },
                            );
                          }
                          else {
                             return Text("No Data Retrieved");
                            // return ListView.builder(
                            //   scrollDirection: Axis.vertical,
                            //   itemCount: 20,
                            //   itemBuilder: (context, index) {
                            //     return PurchaseList(
                            //         id: '56',
                            //         total: 'P1080.00',
                            //         status: 'completed');
                            //   },
                            // );
                          }
                        }),
                  ),
                ]),
              ),
            ),
          )),
    );
  }

  //DATA ROW GENERATOR
  List<DataRow> getDataRow(List<String> strings, String status) {
    List<DataRow> data = [];
    for (int i = 0; i < strings.length; i++) {
      data.add(DataRow(cells: [
        //PRODUCT ID
        DataCell(Text('11315235'), onTap: () => print('OK')),
        DataCell(Text('30kl'), onTap: () => print('OK')),
        DataCell(
            Container(
                decoration: BoxDecoration(
                  color: getStatusColor(status),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    status,
                    style: TextStyle(color: Colors.white),
                  ),
                )),
            onTap: () => print('OK')),
      ]));
    }
    return data;
  }
}

Color getStatusColor(String status) {
  if (status == 'completed') {
    return Colors.green[300];
  } else if (status == 'pending') {
    return Colors.amber[300];
  } else {
    return Colors.red;
  }
}
