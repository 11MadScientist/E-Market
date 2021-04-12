import 'package:flutter/material.dart';
import "package:e_market/designs/appbar.dart";
import "package:horizontal_data_table/horizontal_data_table.dart";

class product extends StatefulWidget {
  @override
  _productState createState() => _productState();
}

class _productState extends State<product> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    String _chosenValue;
    return Scaffold(
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "My Products",
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: DefaultTabController(
          length: 2,
          child: SizedBox(
            width: queryData.size.width,
            child: Column(
              children: [
                TabBar(
                  labelColor: Colors.blue[900],
                  overlayColor: MaterialStateProperty.all(Colors.orange),
                  tabs: [
                    Tab(
                      text: "Product List",
                    ),
                    Tab(
                      text: "Add Product",
                    )
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    children: [
                      //PRODUCT LIST PAGE
                      Container(
                        child: Column(
                          children: [
                            //PRODUCT TEXTBOX
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Text("Product Name"),
                                  ),
                                  Expanded(
                                    child: SizedBox(
                                      height: 30,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Row(
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                    child: Text("Sales"),
                                  ),
                                  //SALES RANGE START
                                  Expanded(
                                    child: SizedBox(
                                      height: 30,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    child: Text("-"),
                                  ),
                                  //SALES RANGE END
                                  Expanded(
                                    child: SizedBox(
                                      height: 30,
                                      child: TextField(
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            borderSide: BorderSide(
                                              color: Colors.orange,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  //CATEGORY TEXTBOX
                                  SizedBox(
                                    width: queryData.size.width * .5,
                                    child: Row(
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 0, 5, 0),
                                          child: Text("Categories"),
                                        ),
                                        //DROPDOWN CATEGORY
                                        Expanded(
                                          child: Container(
                                            height: 30,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.orange,
                                                width: 1,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                            ),
                                            child: DropdownButton<String>(
                                              elevation: 0,
                                              focusColor: Colors.white,
                                              value: _chosenValue,
                                              style: TextStyle(
                                                  color: Colors.blue[900]),
                                              iconEnabledColor:
                                                  Colors.blue[900],
                                              items: <String>[
                                                'Meat',
                                                'Chicken',
                                                'Spices',
                                                'Vegetable',
                                                'Other',
                                              ].map<DropdownMenuItem<String>>(
                                                  (String value) {
                                                return DropdownMenuItem<String>(
                                                  value: value,
                                                  child: Text(
                                                    value,
                                                    style: TextStyle(
                                                        color: Colors.blue[900],
                                                        fontFamily: 'Poppins'),
                                                  ),
                                                );
                                              }).toList(),
                                              onChanged: (String value) {
                                                setState(() {
                                                  _chosenValue = value;
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
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child: Container(
                                width: queryData.size.width * .5,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(0, 0, 5, 0),
                                      child: Text("Stock"),
                                    ),
                                    //STOCK RANGE START
                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                      child: Text("-"),
                                    ),
                                    //STOCK RANGE END
                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                //SEARCH BUTTON
                                SizedBox(
                                  width: queryData.size.width * .25,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.orange),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                    ),
                                    child: Text("Search"),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                //RESET BUTTON
                                SizedBox(
                                  width: queryData.size.width * .25,
                                  child: ElevatedButton(
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(color: Colors.orange),
                                      )),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                    ),
                                    child: Text("Reset"),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              //TABLE BORDER
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(
                                      color: Colors.orange,
                                    )),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: HorizontalDataTable(
                                    leftHandSideColumnWidth:
                                        queryData.size.width * .4,
                                    rightHandSideColumnWidth:
                                        queryData.size.width -
                                            (queryData.size.width * .4),
                                    isFixedHeader: true,
                                    //HEADER
                                    headerWidgets: [
                                      Container(
                                        width: queryData.size.width * .4,
                                        child: Text("Product Name"),
                                        height: 20,
                                      ),
                                      Container(
                                        width: queryData.size.width * .2,
                                        child: Text("Price"),
                                        height: 20,
                                      ),
                                      Container(
                                        width: queryData.size.width * .2,
                                        child: Text("Stock"),
                                        height: 20,
                                      ),
                                      Container(
                                        width: queryData.size.width * .2,
                                        child: Text("Sales"),
                                        height: 20,
                                      ),
                                    ],
                                    //PRODUCT NAME DATA COLUMN (Product Name)
                                    leftSideItemBuilder:
                                        _generateFirstColumnRow,
                                    //PRODUCT INFO DATA ROWS (Price, Stock, Sales)
                                    rightSideItemBuilder:
                                        _generateRightSideColumnRow,
                                    //ITEM DATA COUNTER
                                    itemCount: 1,
                                    //LINE SEPARATOR
                                    rowSeparatorWidget: Divider(
                                      color: Colors.orange,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      //ADD PRODUCT
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Photos"),
                              Row(
                                children: [
                                  Container(
                                    width: queryData.size.width * .25,
                                    height: queryData.size.height * .1,
                                    decoration: BoxDecoration(
                                      color: Colors.orange,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.add_photo_alternate_rounded,
                                        color: Colors.white,
                                      ),
                                      iconSize: 50,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 0, 10, 0),
                                      child: Text("Product Name"),
                                    ),
                                    //PRODUCT TEXTFIELD
                                    Expanded(
                                      child: SizedBox(
                                        height: 30,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(15),
                                              borderSide: BorderSide(
                                                color: Colors.orange,
                                              ),
                                            ),
                                          ),
                                        ),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Container(
      alignment: Alignment.centerLeft,
      child: Text("Cabbage"),
      width: queryData.size.width * .3,
      height: 30,
    );
  }

  Widget _generateRightSideColumnRow(BuildContext context, int index) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Row(
      children: [
        Container(
          width: queryData.size.width * .2,
          height: 30,
          child: Text("P50/kl"),
          alignment: Alignment.centerLeft,
        ),
        Container(
          width: queryData.size.width * .2,
          height: 30,
          child: Text("500"),
          alignment: Alignment.centerLeft,
        ),
        Container(
          width: queryData.size.width * .2,
          height: 30,
          child: Text("10"),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

class ProductInfo {
  String name;
  double price;
  int stock;
  int sales;

  ProductInfo(this.name, this.price, this.sales, this.stock);
}
