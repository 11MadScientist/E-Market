import 'package:flutter/material.dart';

class NearbyStoresCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      height: 214,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.orange,
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment:
              MainAxisAlignment.end,
              children: [
                Icon(
                  Icons.favorite_border,
                  color: Colors.white,
                  size: 20,
                ),
              ],
            ),
            Container(
              height: 80,
              // decoration: BoxDecoration(color: Colors.black),
              alignment: Alignment.center,
              child: CircleAvatar(
                backgroundColor:
                Colors.orange[100],
                child: Text(
                  "TS",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    color: Colors.orange,
                    fontWeight: FontWeight.normal,
                  ),
                ),
                radius: 30,
              ),
            ),
            SizedBox(
              height: 13,
            ),
            Text(
              "Tommy Store",
              style: TextStyle(
                fontSize: 15,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment
                          .start,
                      children: [
                        Text(
                          "Basak, Lapu-Lapu City",
                          style: TextStyle(
                            fontSize: 10,
                            color: Colors.white,
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment
                              .start,
                          children: [
                            Text(
                              "4.5",
                              style: TextStyle(
                                fontSize: 15,
                                color:
                                Colors.white,
                              ),
                            ),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                              size: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.circle,
                          color: Colors.white,
                          size: 30,
                        ),
                        Icon(
                          Icons.chevron_right,
                          color: Colors.orange,
                          size: 20,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
