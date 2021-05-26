import 'package:flutter/material.dart';

class ConfirmPopup {
  final MediaQueryData data;
  final BuildContext context;
  final String buttonText;
  final String transactionID;

  ConfirmPopup({
    this.data,
    this.context,
    this.buttonText,
    this.transactionID,
  }) {
    displayPopup(data);
  }

  Future displayPopup(MediaQueryData data) async {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                height: 110,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Text(
                        "Confirmation",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Transaction ID: ' + transactionID),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          SizedBox(
                            width: data.size.width * .4,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.red),
                              ),
                              child: Text('Decline'),
                            ),
                          ),
                          SizedBox(
                            width: data.size.width * .4,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(0),
                                foregroundColor:
                                    MaterialStateProperty.all(Colors.white),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.green[600]),
                              ),
                              child: Text('Accept'),
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
