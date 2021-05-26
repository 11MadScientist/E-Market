import 'package:e_market/designs/popup.dart';
import 'package:e_market/model/Cart.dart';
import 'package:e_market/model/Product.dart';
import 'package:e_market/services/cart_api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';

class QuantityPopup {
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final CartAPIGateway apiGateway = CartAPIGateway();
  @override
  String user_id;

  Future<Cart> _addToCart(Map data) async
  {
    Cart _cart = await apiGateway.asyncPost(data);
    return _cart;
  }
  Future<Cart> _changeCart(Map data) async
  {
    Cart _cart = await apiGateway.asyncPut(data);
    return _cart;
  }

  Future<void> _getProfile() async
  {
    await FlutterSession().get("user_id").then((value)
        {
          user_id = value.toString();
        }

    );
  }
  final MediaQueryData data;
  final BuildContext context;
  final Product product;
  Cart cart;
  final String buttonText;
  final Function func;

  int productCounter = 1;

  QuantityPopup({
    this.data,
    this.context,
    this.buttonText,
    this.product,
    this.cart,
    this.func,
  }) {
    displayPopup(data);
  }

  Future displayPopup(MediaQueryData data) async {
    if(cart != null)
      {productCounter = cart.prodQty;}
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: data.size.height * .3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            //IMAGE FOR PRODUCT
                            height: data.size.height * .1,
                            width: data.size.height * .1,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("lib/assets/${product.prodImg}"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "${product.prodPrice}/${product.prodUnit}",
                                  style: TextStyle(
                                    fontSize: data.size.width * .06,
                                    color: Colors.orange,
                                  ),
                                ),
                                Text("${product.prodAvail} ${product.prodUnit} available"),
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text("Quantity"),
                            ),
                            IconButton(
                                icon: Icon(
                                  Icons.remove_circle,
                                ),
                                onPressed: () =>
                                    setState(()
                                    {
                                      if(productCounter<2)
                                        {
                                          return;
                                        }
                                      else
                                        productCounter--;
                                    })),
                            //QUANTITY
                            Text(
                              productCounter.toString() +" ${product.prodUnit}/s",
                            ),
                            //QUANTITY
                            IconButton(
                                icon: Icon(
                                  Icons.add_circle,
                                ),
                                onPressed: () =>
                                    setState(()
                                    {
                                      if(productCounter == product.prodAvail)
                                        {return;}
                                      else
                                        productCounter++;
                                    }))
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: data.size.width * .4,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Text('Cancel'),
                            ),
                          ),
                          SizedBox(
                            width: data.size.width * .4,
                            child: ElevatedButton(
                              onPressed: ()async
                              {
                                //getting the profile using FlutterSession
                                await _getProfile();

                                //setting the Map to be passed on post
                                Map _cartInfo;


                                if(buttonText == "Add to Cart")
                                  {
                                    setState(() {
                                      _cartInfo = {
                                        "acc_id"    : user_id,
                                        "store_id"  :product.storeId.toString(),
                                        "prod_id"   :product.id.toString(),
                                        "prod_qty"  :productCounter.toString(),
                                        "prod_price":product.prodPrice.toString(),
                                        "total"     :(product.prodPrice * productCounter).toString(),
                                      };
                                    });
                                    // print("_cartInfo: ${_cartInfo}");
                                    func;
                                    _addToCart(_cartInfo).then((value)
                                    {
                                      Navigator.of(context).pop();
                                    });

                                  }
                                else if(buttonText == "Change Quantity")
                                  {
                                    setState(() {
                                      _cartInfo = {
                                        "id"         :cart.id.toString(),
                                        "acc_id"     :user_id.toString(),
                                        "store_id"   :product.storeId.toString(),
                                        "prod_id"    :product.id.toString(),
                                        "prod_qty"   :productCounter.toString(),
                                        "prod_price" :product.prodPrice.toString(),
                                        "total"      :(product.prodPrice * productCounter).toString(),
                                      };
                                    });
                                    // print("_cartInfo: ${_cartInfo}");
                                    func;
                                    _changeCart(_cartInfo).then((value)
                                    {
                                      Navigator.of(context).pop();
                                    });
                                  }
                              },
                              style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.orange),
                              ),
                              child: Text(buttonText),
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
