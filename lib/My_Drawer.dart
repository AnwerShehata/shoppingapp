import 'package:flutter/material.dart';
import './userScreens/My_Notifications.dart';
import './userScreens/My_History.dart';
import './userScreens/My_About.dart';
import './userScreens/My_Profile.dart';
import './userScreens/My_Delivery.dart';
import 'package:shoppingapp/Authentication/Ui_Page/Login.dart';


class My_Drawer extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Drawer> {
  @override
  Widget build(BuildContext context) {
    return new Drawer(
    child: new Column(
    children: <Widget>[
    new UserAccountsDrawerHeader(
    accountName: new Text("Anwer shehata"),
    accountEmail: new Text("anwershehata@gmail.com"),
    currentAccountPicture: new CircleAvatar(
    backgroundColor: Colors.white,
    child: new Icon(Icons.account_circle ,size: 30.0,),
    ),
    ),
    new ListTile(
    title: new Text("order Notification"),
    leading: new CircleAvatar(child: Icon(Icons.notifications),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Notifications()));
    },
    ),
    new ListTile(
    title: new Text("order History"),
    leading: new CircleAvatar(child: Icon(Icons.history),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_History()));

    },
    ),
    new Divider(),
    new ListTile(
    title: new Text("Profile Settings "),
    leading: new CircleAvatar(child: Icon(Icons.account_circle),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Profile()));
    },
    ),
    new ListTile(
    title: new Text("Delivery Address"),
    leading: new CircleAvatar(child: Icon(Icons.home),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Delivery()));
    },
    ),
    new Divider(),
    new ListTile(
    title: new Text("About US"),
    trailing: new CircleAvatar(child: Icon(Icons.help),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_About()));
    },
    ),
    new ListTile(
    title: new Text("Login"),
    trailing: new CircleAvatar(child: Icon(Icons.exit_to_app),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));
    },
    ),
    ],
    ),
    );
  }
}