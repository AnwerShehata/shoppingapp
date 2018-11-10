import 'package:flutter/material.dart';

class My_Profile extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Profile> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        appBar: new AppBar(
          centerTitle: false,
          title: new Text(" Profile Settings"),
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
              onPressed: (){Navigator.pop(context,true);})
        ),



      ),
    );
  }
}