import 'package:flutter/material.dart';

class QuantityPopup {
  final MediaQueryData data;
  final BuildContext context;
  final String buttonText;

  QuantityPopup({
    this.data,
    this.context,
    this.buttonText,
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
                height: data.size.height * .3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(),
                ),
              );
            },
          );
        });
  }
}
