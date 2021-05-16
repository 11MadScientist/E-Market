import 'package:flutter/material.dart';

// popup = new PopUp(data: queryData, icon: Icons.error_outline,
//                                   title: 'ERROR', message: 'Email/Password is incorrect!', context: context);

class PopUp {
  final MediaQueryData data;
  final String title;
  final String message;
  final IconData icon;
  final BuildContext context;

  PopUp({this.data, this.title, this.message, this.icon, this.context}) {
    displayDialog(data);
  }

  Future displayDialog(MediaQueryData data) async {
    return (showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.symmetric(
                vertical: data.size.height * .15,
                horizontal: data.size.width * .10),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: data.size.width * .05,
              ),
            ),
            content: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    icon,
                    color: Colors.red,
                    size: data.size.width * .15,
                  ),
                  // Expanded(child: SizedBox(width: data.size.width * .005,)),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontSize: data.size.width * .05,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'Close',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: data.size.width * .04,
                    ),
                  ))
            ],
          );
        }));
  }
}
