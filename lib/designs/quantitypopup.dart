import 'package:flutter/material.dart';

class QuantityPopup {
  final MediaQueryData data;
  final String imageData;
  final String price;
  final String stock;
  final String buttonText;
  final BuildContext context;

  QuantityPopup(
      {this.data,
      this.imageData,
      this.price,
      this.stock,
      this.buttonText,
      this.context}) {
    displayPopup(data);
  }

  Future displayPopup(MediaQueryData data) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
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
                            image: AssetImage(imageData),
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
                              "P100/kl",
                              style: TextStyle(
                                fontSize: data.size.width * .06,
                                color: Colors.orange,
                              ),
                            ),
                            Text(stock),
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
