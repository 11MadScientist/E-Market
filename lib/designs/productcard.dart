import 'package:flutter/material.dart';

class ProductListCard extends StatelessWidget {
  final String imageData;
  final String productName;
  int productCounter = 1;
  final String price;

  ProductListCard({this.imageData, this.productName, this.price});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20, 15, 0),
          child: Container(
            height: 210,
            width: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.orange,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  //PRODUCT IMAGE
                  Container(
                      height: 100,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(imageData),
                              fit: BoxFit.cover))),
                  SizedBox(
                    height: 10,
                  ),
                  //PRODUCT NAME
                  Text(
                    productName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                  Row(
                    children: [
                      //DECREASE QUANTITY
                      IconButton(
                        icon: Icon(
                          Icons.remove_circle,
                          color: Colors.white,
                        ),
                      ),
                      //QUANTITY
                      Text(
                        productCounter.toString() + 'kl',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      //QUANTITY
                      IconButton(
                        icon: Icon(
                          Icons.add_circle,
                          color: Colors.white,
                        ),
                      ),
                      //PRODUCT PRICE
                      Text(
                        price,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 170,
          child: RawMaterialButton(
            onPressed: () {},
            elevation: 2.0,
            fillColor: Colors.red,
            child: Icon(
              Icons.delete_outline,
              size: 20.0,
              color: Colors.white,
            ),
            shape: CircleBorder(),
          ),
        ),
      ],
    );
  }
}
