import 'package:e_market/designs/popup.dart';
import 'package:e_market/designs/quantitypopup.dart';
import 'package:e_market/model/Cart.dart';
import 'package:e_market/model/Product.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/item_description.dart';
import 'package:e_market/services/cart_api_gateway.dart';
import 'package:e_market/services/product_api_gateway.dart';
import 'package:flutter/material.dart';

class CartListCard extends StatelessWidget {
  int productCounter = 1;
  final Cart cart;
  final Function delete;
  final Profile profile;
  CartListCard({this.profile,this.cart, this.delete});

  final ProductAPIGateway productApiGateway = ProductAPIGateway();
  final CartAPIGateway cartApiGateway = CartAPIGateway();
  Future<Product> _product;
  Future<Cart> _cart;
  bool isBuyer = false;

  void _session() async
  {
    print(cart.prodId);
    _product = productApiGateway.asyncGet(cart.prodId);
  }

  Future<Cart> _removeItem() async
  {
    _cart =  cartApiGateway.asyncDelete(cart.id);
    return _cart;
  }


  @override
  Widget build(BuildContext context) {

    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    _session();
    return FutureBuilder(
        future: _product,
        builder: (BuildContext context, AsyncSnapshot<Product> snapshot)
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
            return GestureDetector(
              onTap: () =>
                  Navigator.of(context).pushReplacement(MaterialPageRoute
                  (
                    builder:(context) => ItemDescription(
                      product: snapshot.data,
                      cart: cart,
                      profile:profile,),
                   )),
              child: Stack(
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
                                        image: AssetImage("lib/assets/${snapshot.data.prodImg}"),
                                        fit: BoxFit.cover))),
                            SizedBox(
                              height: 10,
                            ),
                            //PRODUCT NAME
                            Text(
                              snapshot.data.prodName,
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
                                  // productCounter.toString() + 'kl',
                                  "${cart.prodQty} kl/s",
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
                                  "P${snapshot.data.prodPrice}",
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
                    child: Stack(
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.red,
                          size: 40,
                        ),
                        Center(
                          child: IconButton(
                            onPressed: ()async
                            {
                             await _removeItem().then((value)
                              {
                                PopUp(
                                    data: queryData,
                                    icon: Icons.check_circle,
                                    title: 'SUCCESS',
                                    coloring: Colors.green,
                                    message:"Item Successfully removed from Cart",
                                    context: context);

                              });
                             delete();

                            },
                            icon: Icon(
                              Icons.delete_outline,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
          else
          {
            return Text("Empty Cart");
          }
        });
  }
}
