import 'package:flutter/material.dart';

class My_OrderHistosy extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_OrderHistosy> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      theme: new ThemeData(fontFamily: "Cairo"),
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(


        //------------- AppBar---------------------------------------------------------------
      appBar: new AppBar(title: new Text("Order Histosy"),
        centerTitle: false,
        backgroundColor: Colors.teal.shade400,
         elevation: 0.0,
          leading: new IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,),
              onPressed: (){Navigator.pop(context, true);}),
        ),




      ),
    );
  }


}