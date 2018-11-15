import 'package:flutter/material.dart';
import 'package:shoppingapp/Authentication/app_tools.dart';
import './userScreens/My_Notifications.dart';
import './userScreens/My_History.dart';
import './userScreens/My_About.dart';
import './userScreens/My_Profile.dart';
import './userScreens/My_Delivery.dart';
import './Authentication/app_data.dart';
import './Authentication/app_methods.dart';
import './Authentication/firebase_methods.dart';
import 'dart:io';
import 'package:shoppingapp/Authentication/Ui_Page/Login.dart';
import 'package:shared_preferences/shared_preferences.dart';



class My_Drawer extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Drawer> {


  //== هذا الكود هو الذي يستدعي اسم المستخدم والايميل .. ويتم عرضهم في صفحة  البروفايل او الدراوبل
  BuildContext context;
  String acctName = "";
  String acctEmail = "";
  String acctPhotoURL = "";
  bool isLoggedIn;
  AppMethods appMethods = new FirebaseMethods();

  @override
  void initState() {
    // TODO: implement initState
    getCurrentUser();
    super.initState();
  }

  Future getCurrentUser() async {
    acctName = await getStringDataLocally(key: acctFullName);
    acctEmail = await getStringDataLocally(key: userEmail);
    acctPhotoURL = await getStringDataLocally(key: photoURL);
    isLoggedIn = await getBoolDataLocally(key: loggedIN);
    //print(await getStringDataLocally(key: userEmail));
    acctName == null ? acctName = "UserName" : acctName;
    acctEmail == null ? acctEmail = "EmailUser@email.com" : acctEmail;
    setState(() {});
  }

  //=== هنا نهاية الكود





  @override
  Widget build(BuildContext context) {
    return new Drawer(
    child: new Column(
    children: <Widget>[

      // =======DrawerHeader =============================
    new UserAccountsDrawerHeader(
    accountName: new Text(acctName),
    accountEmail: new Text(acctEmail),
    currentAccountPicture: new CircleAvatar(
    backgroundColor: Colors.white,
    child: new Icon(Icons.account_circle ,size: 30.0,),
    ),
    ),


    // =======order Notification =============================
    new ListTile(
    title: new Text("order Notification"),
    leading: new CircleAvatar(child: Icon(Icons.notifications),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Notifications()));
    },
    ),


    // =======order History =============================
    new ListTile(
    title: new Text("order History"),
    leading: new CircleAvatar(child: Icon(Icons.history),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_History()));
    },
    ),


    // =======Profile Settings =============================
    new Divider(),
    new ListTile(
    title: new Text("Profile Settings "),
    leading: new CircleAvatar(child: Icon(Icons.account_circle),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Profile()));
    },
    ),


    // =======Delivery Address =============================
    new ListTile(
    title: new Text("Delivery Address"),
    leading: new CircleAvatar(child: Icon(Icons.home),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Delivery()));
    },
    ),


    // =======About US ========================================
    new Divider(),
    new ListTile(
    title: new Text("About US"),
    trailing: new CircleAvatar(child: Icon(Icons.help),),
    onTap: (){
    Navigator.push(context, MaterialPageRoute(builder: (context)=> My_About()));
    },
    ),


    // =======Login ===========================================
    new ListTile(
      title: new Text("Login"),
      trailing: new CircleAvatar(child: Icon(Icons.exit_to_app),),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
      },
    ),


    new ListTile(
      title: new Text( "Logout"),
      trailing: new CircleAvatar(child: Icon(Icons.exit_to_app),),
      onTap: (){ appMethods.logOutUser();
      },
    ),


    ],
    ),
    );
  }

  checkIfLoggedIn() async {

    if (isLoggedIn == false) {
      bool response = await Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),);
      if (response == true) getCurrentUser();

      return;
    }
    bool response = await appMethods.logOutUser();
    if (response == true) getCurrentUser();
  }



}

