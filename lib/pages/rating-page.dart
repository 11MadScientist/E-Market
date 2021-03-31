import 'package:flutter/material.dart';

class RatingPage extends StatefulWidget {
  RatingPage({Key key}) : super(key: key);

  @override
  _RatingPageState createState() => _RatingPageState();
}

class _RatingPageState extends State<RatingPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return MaterialApp(
      title: 'Flutter Demo',
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.white),
             onPressed: ()=>{},
              // onPressed: () => Navigator.of(context).pop(),),
            ),
            centerTitle: true,
            title: Text('Ratings', style: TextStyle(
              fontSize: 20,
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
            ),),
            automaticallyImplyLeading: false,
            backgroundColor: Colors.orange[500],
            bottom: 
            TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(text: 'All', icon: Icon(Icons.comment_rounded)),
                Tab(text: 'To reply', icon: Icon(Icons.add_comment_rounded)),
                Tab(text: 'Replied', icon: Icon(Icons.check)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child: Text('All', )),
              Center(child: Text('To reply')),
              Center(child: Text('Replied')),
            ],
          ),
        ),
      ),
    );
  }
}
