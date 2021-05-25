import 'package:flutter/material.dart';
import 'package:e_market/designs/appbar.dart';
// import 'package:horizontal_data_table/refresh/pull_to_refresh/pull_to_refresh.dart';

class OrderDetails extends StatefulWidget {
  @override
  OrderDetailsState createState() => OrderDetailsState();
}

class OrderDetailsState extends State<OrderDetails> {
  @override
  Widget build(BuildContext context) {
    //FIELDS
    List<IconData> listIcon =
        new List.generate(3, (index) => generateIconStatus(index));

    //INDEX 0 - ICON FOR PENDING
    //INDEX 1 - ICON FOR COMPLETE
    //INDEX 2 - ICON FOR CANCELLED
    IconData orderStatusIcon = listIcon[2];
    String statusString = 'Pending';
    String deliveryTime = '25/05/2021 17:00';
    String statusDetailsString =
        'Your order is in pending status by the seller and expected to arrive at your address by ';
    String userName = "Angeline Quinto";
    String userContactNum = '09991085084';
    String userLocation =
        'Lot 5 Block 31, Aurton St. Suba-Masulog, Basak, Lapu-Lapu City, 6015. Philippines';
    String modeOfPayment = 'Cash on Delivery';
    Map prodSummary = {
      'Pork Belly (2kl)': 'P400.00',
      'Eggplant (1kl)': 'P100.00'
    };
    String subTotal = 'P500.00';
    String deliveryFee = 'P50.00';
    String orderTotal = 'P550.00';
    String orderID = 'KJV654635654';
    String orderTime = '20/05/2021 10:00';
    String paymentTime = 'N/A';
    String completedTime = 'N/A';
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: MyAppBar(
        size: queryData.size.width,
        screenName: "Order Details",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: queryData.size.height * .15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                    border: Border.all(
                      color: Colors.orange,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(
                              orderStatusIcon,
                              color: Colors.orange,
                              size: queryData.size.width * .2,
                            ),
                            Text(
                              statusString,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            statusDetailsString +
                                deliveryTime +
                                ". Refer to the delivery time below.",
                            style: TextStyle(
                              fontSize: queryData.size.width * .04,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_sharp,
                            size: queryData.size.width * .07,
                            color: Colors.blue[900],
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            'Delivery Address',
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              userName,
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                            Text(
                              userContactNum,
                              style: TextStyle(
                                fontSize: queryData.size.width * .04,
                              ),
                            ),
                            Text(
                              userLocation,
                              style: TextStyle(
                                fontSize: queryData.size.width * .04,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.payment_rounded,
                          size: queryData.size.width * .07,
                          color: Colors.blue[900],
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Mode of Payment',
                          style: TextStyle(
                            fontSize: queryData.size.width * .05,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0, bottom: 10),
                      child: Text(
                        modeOfPayment,
                        style: TextStyle(
                          fontSize: queryData.size.width * .05,
                        ),
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.payments_rounded,
                      size: queryData.size.width * .07,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Total Payment',
                      style: TextStyle(
                        fontSize: queryData.size.width * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Product Summary",
                        style: TextStyle(
                          fontSize: queryData.size.width * .05,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Column(
                          children:
                              generateMapFromProduct(prodSummary, queryData),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Subtotal',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            subTotal,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Delivery Fee',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            deliveryFee,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Order Total',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            orderTotal,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.black54,
                  thickness: 1,
                ),
                Row(
                  children: [
                    Icon(
                      Icons.add_box_rounded,
                      size: queryData.size.width * .07,
                      color: Colors.blue[900],
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Additional Details',
                      style: TextStyle(
                        fontSize: queryData.size.width * .05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Order ID',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            orderID,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Order Time',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            orderTime,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Payment Time',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            paymentTime,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Delivery Time',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            deliveryTime,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Completed Time',
                              style: TextStyle(
                                fontSize: queryData.size.width * .05,
                              ),
                            ),
                          ),
                          Text(
                            completedTime,
                            style: TextStyle(
                              fontSize: queryData.size.width * .05,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  IconData generateIconStatus(int index) {
    List<IconData> icons = [];
    icons.add(Icons.delivery_dining);
    icons.add(Icons.done_all_rounded);
    icons.add(Icons.cancel_rounded);
    return icons[index];
  }

  List<Widget> generateMapFromProduct(Map prod, MediaQueryData queryData) {
    List<Widget> prodSummary = [];
    prod.forEach((key, value) {
      prodSummary.add(Row(
        children: [
          Expanded(
            child: Text(
              key,
              style: TextStyle(
                fontSize: queryData.size.width * .04,
              ),
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: queryData.size.width * .04,
            ),
          ),
        ],
      ));
    });
    return prodSummary;
  }
}
