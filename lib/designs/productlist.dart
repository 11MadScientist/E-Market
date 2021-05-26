import 'package:e_market/pages/item_description.dart';
import 'package:flutter/material.dart';
import 'package:e_market/model/Product.dart';

class ProductList extends StatelessWidget {
  final Product product;
  ProductList({this.product});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
        {
          Navigator.of(context).push(MaterialPageRoute
            (
            builder:(context) => ItemDescription(product: product),
          ));
        },
      child: Padding(

        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 20,
                              color: Colors.blue[900],
                            ),
                            Expanded(
                              child: Text(product.storeName),
                            ),
                            Text('1h ago')
                          ],
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadiusDirectional
                                      .circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/${product.prodImg}'),
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        Text(
                          product.prodName,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          product.prodPrice.toString()+" per "+product.prodUnit,
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        product.prodFavorite.toString(),
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
