import 'package:e_market/designs/popup.dart';
import 'package:e_market/model/Cart.dart';
import 'package:e_market/model/profile.dart';
import 'package:e_market/pages/MyBottomNavigationBar.dart';
import 'package:e_market/services/cart_api_gateway.dart';
import 'package:e_market/utils/env_endpoints.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/quantitypopup.dart';
import 'package:e_market/model/Product.dart';

class ItemDescription extends StatefulWidget {
  @override
  final Product product;
  final Cart cart;
  final Profile profile;

  ItemDescription({this.product, this.cart, this.profile});

  _ItemDescriptionState createState() => _ItemDescriptionState();
}

class _ItemDescriptionState extends State<ItemDescription> {
  final EnvEndPoints envEndPoints = EnvEndPoints();
  final CartAPIGateway apiGateway = CartAPIGateway();
  Cart _cart;
  String txtButton;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.cart == null)
      txtButton = "Add to Cart";
    else
      txtButton = "Change Quantity";

    if(widget.profile.usertype == "Seller")
      {
        Navigator.of(context).pop();
      }
  }



  bool toggleDescription = false;
  var iconDescription = Icon(Icons.keyboard_arrow_down, color: Colors.blue[900]);


  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    QuantityPopup quantityPopup;
    queryData = MediaQuery.of(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            //BACKGROUND FOR IMAGE SELECTED OF THE PRODUCT
            height: queryData.size.height * .4,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('lib/assets/${widget.product.prodImg}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          //SCROLLING
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //TRANSPARENT CONTAINER TO SEE THE BG SELECTED PHOTO IN OTHER PHOTOS
                Container(
                    height: queryData.size.height * .35,
                    child: Stack(
                      children: [
                        //BACK BUTTON (TOP)
                        Positioned(
                            top: queryData.size.height * .05,
                            child: RawMaterialButton(
                              onPressed: () {},
                              elevation: 2.0,
                              fillColor: Colors.orange,
                              child: IconButton(
                                icon: Icon(
                                  Icons.chevron_left_outlined,
                                  size: 20.0,
                                  color: Colors.white,
                                ),
                                onPressed: ()
                                {
                                  if(widget.cart  == null)
                                    Navigator.of(context).pop();
                                  else
                                    Navigator.of(context).pushReplacement(MaterialPageRoute
                                      (
                                      builder:(context) => MyBottomNavigationBar(
                                       profile: widget.profile,
                                       idx: 2,),
                                    ));

                                },
                              ),
                              shape: CircleBorder(),
                            )),
                      ],
                    )),
                //CONTENT
                Stack(
                  children: [
                    //SCROLL BACKGROUND DESIGN
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                //PRODUCT NAME
                                Text(
                                  widget.product.prodName,
                                  style: TextStyle(
                                    fontSize: 20,
                                  ),
                                ),
                                //DECSRIPTION BUTTON
                                IconButton(
                                  icon: iconDescription,
                                  onPressed: () => setState(
                                    () =>
                                        toggleDescription = !toggleDescription,
                                  ),
                                ),
                                //FAVORITE ICON
                                Expanded(
                                  child: Align(
                                      alignment: Alignment.bottomRight,
                                      child: RawMaterialButton(
                                        onPressed: () {},
                                        elevation: 0,
                                        fillColor: Colors.red,
                                        child: Icon(
                                          Icons.favorite,
                                          size: 20.0,
                                          color: Colors.white,
                                        ),
                                        shape: CircleBorder(),
                                      )),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Text(
                                "${widget.product.prodPrice} pesos/"
                                    "${widget.product.prodUnit}",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.orange,
                                ),
                              ),
                            ),
                            //PRODUCT DESCRIPTION
                            Visibility(
                              visible: toggleDescription,
                              child: Container(
                                child: Padding(
                                  padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                  child: Text(
                                    widget.product.prodDesc
                                      ),
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //STORE NAME
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                              child: Icon(
                                                Icons.account_circle_rounded,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                            Text(widget.product.storeName),
                                          ],
                                        ),
                                        //STOCKS SOLD
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                              child: Icon(
                                                Icons.attach_money_outlined,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                            Text( widget.product.prodSales.toString()
                                                +" "+widget.product.prodUnit+'/s sold'),
                                          ],
                                        ),
                                        //STOCKS AVAILABLE
                                        Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.fromLTRB(
                                                      0, 0, 10, 0),
                                              child: Icon(
                                                Icons.storage,
                                                color: Colors.blue[900],
                                              ),
                                            ),
                                            Text(widget.product.prodAvail.toString()
                                            +" "+widget.product.prodUnit+"/s available"),
                                          ],
                                        ),
                                      ],
                                    ),
                                    Expanded(
                                      child: SizedBox(),
                                    ),
                                    //OVERALL AVG RATING OF THE PRODUCT
                                    Text(
                                      "4.5",
                                      style: TextStyle(
                                        fontSize: 50,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      color: Colors.orange,
                                      size: 60,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Text(
                                'Other Photos',
                                style: TextStyle(
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            //ROW OTHER PHOTOS
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/${widget.product.prodImg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/${widget.product.prodImg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/${widget.product.prodImg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                'lib/assets/${widget.product.prodImg}'),
                                            fit: BoxFit.cover,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //RATING SECTION
                            Padding(
                              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      'Ratings',
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                  //RATINGS PAGE SELECTOR ICONS
                                  IconButton(
                                    icon: Icon(
                                      Icons.chevron_left,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.chevron_right,
                                      color: Colors.blue[900],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            //ONE RATING
                            Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Column(
                                            children: [
                                              //RATING HEADER
                                              Row(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  //PROFILE PICTURE
                                                  Icon(
                                                    Icons.account_circle,
                                                    color: Colors.blue[900],
                                                    size: 35,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      //RATER'S NAME
                                                      Text('James Heath'),
                                                      //STARS RATING
                                                      Row(
                                                        children: [
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                            size: 20,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                            size: 20,
                                                          ),
                                                          Icon(
                                                            Icons.star,
                                                            color:
                                                                Colors.orange,
                                                            size: 20,
                                                          ),
                                                          Icon(
                                                            Icons.star_border,
                                                            color:
                                                                Colors.orange,
                                                            size: 20,
                                                          ),
                                                          Icon(
                                                            Icons.star_border,
                                                            color:
                                                                Colors.orange,
                                                            size: 20,
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          Expanded(
                                            child: SizedBox(),
                                          ),
                                          Text(
                                            '30-12-21',
                                          ),
                                        ],
                                      ),
                                      Text(
                                          "What a fresh eggplant! Definitely gonna order again! Yum yum yum!!!"),
                                    ],
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                //ADD TO CART BUTTON
                                SizedBox(
                                  width: queryData.size.width * .4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //QUANTITY CONFIRMATION
                                      if(widget.cart != null)
                                        {
                                          quantityPopup = new QuantityPopup(
                                            data: queryData,
                                            buttonText: txtButton,
                                            context: context,
                                            product: widget.product,
                                            cart: widget.cart,
                                            func: ()
                                              {
                                                PopUp(
                                                    data: queryData,
                                                    icon: Icons.check_circle,
                                                    title: 'Success',
                                                    coloring: Colors.green,
                                                    message:"Quantity Changed Successfully",
                                                    context: context);
                                              }
                                          );
                                        }
                                      else
                                        {
                                          quantityPopup = new QuantityPopup(
                                            data: queryData,
                                            buttonText: txtButton,
                                            context: context,
                                            product: widget.product,
                                            func: ()
                                            {
                                              PopUp(
                                                  data: queryData,
                                                  icon: Icons.check_circle,
                                                  title: 'Success',
                                                  coloring: Colors.green,
                                                  message:"Added to Cart Successfully",
                                                  context: context);
                                            }
                                          );
                                        }
                                      },
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.orange),
                                    ),
                                    child: Text(txtButton),
                                  ),
                                ),
                                //BUY NOW BUTTON
                                SizedBox(
                                  width: queryData.size.width * .4,
                                  child: ElevatedButton(
                                    onPressed: () {
                                      //QUANTITY CONFIRMATION
                                      quantityPopup = new QuantityPopup(
                                        data: queryData,
                                        buttonText: "Buy Now",
                                        context: context,
                                        product: widget.product,
                                      );
                                    },
                                    style: ButtonStyle(
                                      foregroundColor:
                                          MaterialStateProperty.all(
                                              Colors.white),
                                      backgroundColor:
                                          MaterialStateProperty.all(Colors.red),
                                    ),
                                    child: Text('Buy Now'),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
