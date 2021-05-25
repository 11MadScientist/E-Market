import 'package:e_market/model/Order.dart';
import 'package:flutter/material.dart';

class PurchaseList extends StatefulWidget {
  @override
  _PurchaseListState createState() => _PurchaseListState();

  final Order order;

  PurchaseList({this.order});
}

class _PurchaseListState extends State<PurchaseList> {
  Color color;

  @override
  void initState() {
    super.initState();
    if(widget.order.orderStatus == "pending")
      color = Colors.orange;
    else if(widget.order.orderStatus == "completed")
      color = Colors.green[600];
    else if(widget.order.orderStatus == "canelled")
      color = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(widget.order.id.toString()),
        Text("P${widget.order.total.toStringAsFixed(2)}"),
        TextButton(
          onPressed:()
          {

          },
          child: Text(
            widget.order.orderStatus,
            style: TextStyle(
              color: Colors.white,
              backgroundColor: color,
            ),

          ),

        ),

      ],
    );
  }
}
