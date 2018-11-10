import 'package:flutter/material.dart';
import 'userScreens/My_HomePage.dart';

void main() => runApp(new MyApp());

class MyApp extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new My_HomePage(




      ),
    );
  }
}