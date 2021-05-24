import 'package:flutter/material.dart';
import "package:e_market/designs/appbar.dart";

class Purchased extends StatefulWidget {
  @override
  _puchasedProduct createState() => _puchasedProduct();
}

class _puchasedProduct extends State<Purchased> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    //LIST FOR PURCHASED PRODUCT
    List<String> dataRows = new List.generate(5, (index) => null);
    String status = 'cancelled';

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "Purchase",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 1,
          child: SizedBox(
            width: queryData.size.width,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.blue[900],
                  overlayColor: MaterialStateProperty.all(Colors.orange),
                  tabs: [
                    Tab(
                      text: "Unpaid",
                    ),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //UNPAID PAGE
                      Container(
                        child: Column(
                          children: [
                            Expanded(
                              //TABLE BORDER
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.orange,
                                    )),
                                child: SingleChildScrollView(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: DataTable(
                                        columnSpacing:
                                            queryData.size.width * .1,
                                        columns: [
                                          DataColumn(
                                              label: Text("Transaction ID")),
                                          DataColumn(
                                              label: Text("Order Total")),
                                          DataColumn(
                                              label: Text(
                                            "Status",
                                          )),
                                        ],
                                        rows: getDataRow(dataRows, status)),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
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
