import 'package:e_market/model/Order.dart';
import 'package:e_market/model/profile.dart';
import 'package:flutter/material.dart';
import 'package:e_market/designs/confirmPopup.dart';

class PurchaseList extends StatefulWidget {
  @override
  _PurchaseListState createState() => _PurchaseListState();
  //_PurchaseListState(id: this.id, total: this.total, status: this.status);

  final Order order;
  final Profile profile;

  PurchaseList({this.order, this.profile});

  // final String id;
  // final String total;
  // final String status;
  //
  // PurchaseList({this.id, this.total, this.status});
}

class _PurchaseListState extends State<PurchaseList> {
  Color color;

  final String id;
  final String total;
  final String status;

  _PurchaseListState({this.id, this.total, this.status});

  @override
  void initState() {
    print("hi");
    super.initState();
    if (widget.order.orderStatus == "pending")
      color = Colors.orange;
    else if (widget.order.orderStatus == "Accepted")
      color = Colors.green[600];
    else if (widget.order.orderStatus == "Declined")
      color = Colors.red;

    // if (status == 'pending')
    //   color = Colors.orange;
    // else if (status == 'completed')
    //   color = Colors.green[600];
    // else
    //   color = Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 2,bottom: 2),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
              // decoration: BoxDecoration(color: Colors.blue),
              alignment: Alignment.center,
              width: queryData.size.width * .3,
              child: Text(widget.order.id.toString())),
          Container(
              // decoration: BoxDecoration(color: Colors.blue),
              alignment: Alignment.center,
              width: queryData.size.width * .3,
              child: Text("P${widget.order.total}")),
          Container(
            width: queryData.size.width * .2,
            child: ElevatedButton(
              onPressed: () {
                ConfirmPopup(
                    data: queryData,
                    context: context,
                    usertype: widget.profile.usertype,
                    transactionID:widget.order.id.toString(),
                    order: widget.order,
                    profile: widget.profile,
                );
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
                widget.order.orderStatus,
                style: TextStyle(
                  fontSize: queryData.size.width * .03,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
