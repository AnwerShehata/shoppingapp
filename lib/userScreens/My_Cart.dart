import 'package:flutter/material.dart';

class My_Cart extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Cart> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(


        //------------- AppBar---------------------------------------------------------------
      appBar: new AppBar(
          centerTitle: false,
          title: new Text("Cart"),
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
              onPressed: (){Navigator.pop(context,true);})
        ),



      ),
    );
  }
}