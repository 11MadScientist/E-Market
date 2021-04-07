import 'package:flutter/material.dart';

class SellerCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
        {
          Navigator.pushNamed(context, '/item_desc');
        },
      child: Padding(

        padding: const EdgeInsets.fromLTRB(0, 20, 0, 10),
        child: Container(
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.orange,
            ),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.account_circle,
                              size: 20,
                              color: Colors.blue[900],
                            ),
                            Expanded(
                              child: Text("Tommy Store"),
                            ),
                            Text('1h ago')
                          ],
                        ),
                        Expanded(
                          child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadiusDirectional
                                      .circular(15),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'lib/assets/eggplant3.jpg'),
                                    fit: BoxFit.cover,
                                  ))),
                        ),
                        Text(
                          'Fresh Eggplants',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'P80/kl',
                        ),
                      ],
                    ),
                  )),
              Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  color: Colors.orange,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        '120',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 20,
                      ),
                      Text(
                        '4.5',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
