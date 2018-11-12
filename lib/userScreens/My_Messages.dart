import 'package:flutter/material.dart';

class My_Messages extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Messages> {


  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(


        //------------- AppBar---------------------------------------------------------------
      appBar: new AppBar(title: new Text("Messages"),
          centerTitle: false,
          leading: new IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,),
              onPressed: (){Navigator.pop(context, true);}),
        ),




      ),
    );
  }


}