import 'package:flutter/material.dart';

class NoProduct extends StatelessWidget {
  final MediaQueryData data;

  const NoProduct({this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150),
      child: Container(
        child: Center(
          child: Column(
            children: [
              Container(
                width: data.size.width * .5,
                height: data.size.height * .2,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('lib/assets/noProduct.png'),
                )),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                "No Product Found :(",
                style: TextStyle(
                  fontSize: data.size.width * .05,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
