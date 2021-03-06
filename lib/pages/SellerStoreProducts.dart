import 'package:e_market/model/profile.dart';
import 'package:e_market/model/store.dart';
import 'package:e_market/services/product_api_gateway.dart';
import 'package:flutter/material.dart';
import "package:e_market/designs/appbar.dart";
import "package:horizontal_data_table/horizontal_data_table.dart";
import 'package:e_market/designs/imageUploader.dart';
import 'package:e_market/services/store_api_gateway.dart';
import 'package:e_market/model/Product.dart';
import 'package:e_market/pages/MyBottomNavigationBar.dart';

class SellerStoreProduct extends StatefulWidget {
  @override

  final Profile profile;
  SellerStoreProduct({this.profile});


  _SellerStoreProductState createState() => _SellerStoreProductState();
}

class _SellerStoreProductState extends State<SellerStoreProduct> {

  Store _storedata;
  String _chosenValue;
  String _chosenUnit;

  //Add Product
  final _prodNameController = TextEditingController();
  String prodName = "";

  final _prodDescController = TextEditingController();
  String prodDesc = "";

  final _prodPriceController = TextEditingController();
  String prodPrice = "";

  final _prodStockController = TextEditingController();
  String prodStock = "";

  //latest id of certain category
  String categoryid = "";
  String storeid = "";

  final StoreAPIGateway storeAPIGateway = StoreAPIGateway();
  final ProductAPIGateway productAPIGateway = ProductAPIGateway();

  Map productsData;
  Product _productInfo;

  Future<Store> _getStore() async
  {
    Store body = await storeAPIGateway.asyncGet(widget.profile.id);

    setState(() {
      storeid = body.id.toString();
    });

    print(storeid);
  }

  @override
  void initState() {
    super.initState();
    _getStore();
  }

  Future <Product> _createProduct(Map data) async
  {
    Product body = await productAPIGateway.asyncPost(data);
    setState(() {
      _productInfo = body;
    });
    return body;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    ImageRow imageRow;
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                              underline: Container(),
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
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(
                              color: Colors.orange,
                              width: 1,
                            ),
                          ),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //PHOTOS
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Text("Photos"),
                                ),
                                Container(
                                  height: queryData.size.height * .15,
                                  child: imageRow = new ImageRow(
                                    queryData: queryData,
                                  ),
                                ),
                                //PRODUCT NAME
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 10, top: 20),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: queryData.size.width * .3,
                                          child: Text("Product Name")),
                                      //PRODUCT TEXTFIELD
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: TextField(
                                            controller: _prodNameController,
                                            onChanged: (val){
                                              setState(() {
                                                prodName = _prodNameController.text;
                                              });
                                              print(prodName);
                                            },
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
                                //CATEGORY
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: queryData.size.width * .3,
                                          child: Text("Category")),
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
                                            underline: Container(),
                                            focusColor: Colors.white,
                                            value: _chosenValue,
                                            style: TextStyle(
                                                color: Colors.blue[900]),
                                            iconEnabledColor: Colors.blue[900],
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
                                //DESCRIPTION
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                          width: queryData.size.width * .3,
                                          child: Text("Description")),
                                      //DESCRIPTION TEXTFIELD
                                      Expanded(
                                        child: Container(
                                          height: 100,
                                          child: TextField(
                                            controller: _prodDescController,
                                            onChanged: (val){
                                              setState(() {
                                                prodDesc = _prodDescController.text;
                                              });
                                              print(prodDesc);
                                            },
                                            maxLines: 5,
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
                                //PRICE
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: queryData.size.width * .3,
                                          child: Text("Price")),
                                      //PRICE TEXTFIELD
                                      Expanded(
                                        child: Container(
                                          height: 30,
                                          child: TextField(
                                            controller: _prodPriceController,
                                            onChanged: (val){
                                              setState(() {
                                                prodPrice = _prodPriceController.text;
                                              });
                                              print(prodPrice);
                                            },
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
                                      //UNIT FIELDS
                                      Padding(
                                        padding:
                                        const EdgeInsets.only(left: 10),
                                        child: Container(
                                          padding: EdgeInsets.only(left: 20),
                                          height: 30,
                                          width: queryData.size.width * .2,
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
                                            underline: Container(),
                                            focusColor: Colors.white,
                                            value: _chosenUnit,
                                            style: TextStyle(
                                                color: Colors.blue[900]),
                                            iconEnabledColor: Colors.blue[900],
                                            items: <String>['kl', 'pc']
                                                .map<DropdownMenuItem<String>>(
                                                    (String value) {
                                                  return DropdownMenuItem<String>(
                                                    value: value,
                                                    child: Text(
                                                      "/$value",
                                                      style: TextStyle(
                                                          color: Colors.blue[900],
                                                          fontFamily: 'Poppins'),
                                                    ),
                                                  );
                                                }).toList(),
                                            onChanged: (String value) {
                                              setState(() {
                                                _chosenUnit = value;
                                              });
                                            },
                                          ),

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //STOCK
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: Row(
                                    children: [
                                      Container(
                                          width: queryData.size.width * .3,
                                          child: Text("Stock")),
                                      //PRODUCT TEXTFIELD
                                      Expanded(
                                        child: SizedBox(
                                          height: 30,
                                          child: TextField(
                                            controller: _prodStockController,
                                            onChanged: (val){
                                              setState(() {
                                                prodStock = _prodStockController.text;
                                              });
                                              print(prodStock);
                                            },
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
                                SizedBox(
                                  width: double.infinity,
                                  height: 50,
                                  child: ElevatedButton(
                                    onPressed: (){
                                      setState(() {
                                        print(prodName);
                                        print(_chosenValue);
                                        print(prodDesc);
                                        print(prodPrice);
                                        print(_chosenUnit);
                                        print(prodStock);

                                        if(_chosenValue.compareTo("Meat") == 0)
                                          categoryid = "1";
                                        else if(_chosenValue.compareTo("Chicken") == 0)
                                          categoryid = "2";
                                        else if(_chosenValue.compareTo("Spices") == 0)
                                          categoryid = "3";
                                        else if(_chosenValue.compareTo("Vegetable") == 0)
                                          categoryid = "4";
                                        else if(_chosenValue.compareTo("Other") == 0)
                                          categoryid = "5";


                                        productsData = {
                                          "store_id"        :storeid,
                                          "category_id"     :categoryid,
                                          "category_name"   :_chosenValue,
                                          "prod_name"       :prodName,
                                          "prod_img"        :"meat.png",
                                          "prod_price"      :prodPrice,
                                          "prod_unit"       :_chosenUnit,
                                          "prod_desc"       :prodDesc,
                                          "prod_stock"      :prodStock,
                                          "prod_sales"      :"0",
                                          "prod_avail"      :"20",
                                          "prod_favorite"   :"5",
                                        };
                                      });

                                      print(productsData);
                                      _createProduct(productsData).then((value) {
                                        Navigator.of(context).pushReplacement(MaterialPageRoute
                                          (
                                          builder:(context) => MyBottomNavigationBar(
                                            profile: widget.profile,
                                            idx: 1,),
                                        ));
                                      });
                                    },
                                    style: ButtonStyle(
                                      shape: MaterialStateProperty.all(
                                          RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          )),
                                      backgroundColor:
                                      MaterialStateProperty.all(
                                        Colors.orange,
                                      ),
                                      foregroundColor:
                                      MaterialStateProperty.all(
                                          Colors.white),
                                    ),
                                    child: Text("Save and Publish"),
                                  ),
                                )
                              ],
                            ),
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
