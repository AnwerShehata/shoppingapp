import 'package:flutter/material.dart';
import 'userScreens/My_HomePage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';

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