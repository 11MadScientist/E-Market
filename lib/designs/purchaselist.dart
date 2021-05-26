import 'package:e_market/model/Order.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/confirmPopup.dart';

class PurchaseList extends StatefulWidget {
  @override
  _PurchaseListState createState() =>
      _PurchaseListState(id: this.id, total: this.total, status: this.status);

  // final Order order;

  // PurchaseList({this.order});

  final String id;
  final String total;
  final String status;

  PurchaseList({this.id, this.total, this.status});
}

class _PurchaseListState extends State<PurchaseList> {
  Color color;

  final String id;
  final String total;
  final String status;

  _PurchaseListState({this.id, this.total, this.status});

  @override
  void initState() {
    super.initState();
    // if (widget.order.orderStatus == "pending")
    //   color = Colors.orange;
    // else if (widget.order.orderStatus == "completed")
    //   color = Colors.green[600];
    // else if (widget.order.orderStatus == "canelled")
    //   color = Colors.red;

    if (status == 'pending')
      color = Colors.orange;
    else if (status == 'completed')
      color = Colors.green[600];
    else
      color = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
            // decoration: BoxDecoration(color: Colors.blue),
            alignment: Alignment.center,
            width: queryData.size.width * .3,
            child: Text(this.id)),
        Container(
            // decoration: BoxDecoration(color: Colors.blue),
            alignment: Alignment.center,
            width: queryData.size.width * .3,
            child: Text(this.total)),
        Container(
          width: queryData.size.width * .2,
          child: ElevatedButton(
            onPressed: () {
              ConfirmPopup(
                  data: queryData,
                  context: context,
                  buttonText: "Decline",
                  transactionID: "7652565");
            },
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all(EdgeInsets.all(2)),
                minimumSize: MaterialStateProperty.all(Size.fromRadius(5)),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                backgroundColor: MaterialStateProperty.all(this.color),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)))),
            child: Text(
              this.status,
              style: TextStyle(
                fontSize: queryData.size.width * .03,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
