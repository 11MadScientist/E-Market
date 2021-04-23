import 'package:flutter/material.dart';

class BestSellingCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 250,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Row(
            children: [
              Container(
                width: 80,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20.0),
                    image: DecorationImage(
                      image: AssetImage(
                          'lib/assets/recommend.jpg'),
                      fit: BoxFit.cover,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Spices",
                            style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Poppins",
                              color: Colors.black45,
                              fontWeight:
                              FontWeight.normal,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.favorite,
                          color: Colors.red,
                          size: 20,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Herbs and Spices',
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: "Poppins",
                        color: Colors.blue[900],
                      ),
                    ),
                    Text(
                      'Tommy Store',
                      style: TextStyle(
                        fontSize: 10,
                        fontFamily: "Poppins",
                        color: Colors.blue[900],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'P 10.58/kl',
                            style: TextStyle(
                              fontSize: 17,
                              fontFamily: "Poppins",
                              color:
                              Colors.blue[900],
                            ),
                          ),
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.blue[900],
                          size: 20,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
