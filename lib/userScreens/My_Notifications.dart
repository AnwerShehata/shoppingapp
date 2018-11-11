import 'package:flutter/material.dart';

class My_Notifications extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Notifications> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        //------------- AppBar---------------------------------------------------------------
      appBar: new AppBar(
          centerTitle: false,
          title: new Text("Notifications"),
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
              onPressed: (){Navigator.pop(context,true);})
        ),



      ),
    );
  }
}