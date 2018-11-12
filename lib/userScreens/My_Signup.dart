import 'package:flutter/material.dart';
import '../Tools/My_AppTools.dart';
import 'dart:async';

class My_Signup extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Signup> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
  TextEditingController _FullName= new TextEditingController();
  TextEditingController _Re_password = new TextEditingController();
  TextEditingController _PhoneNumber = new TextEditingController();
  final scaffoldkey = new  GlobalKey<ScaffoldState>(); //  key scaffoldkey



  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(
        key: scaffoldkey,

        //------------- AppBar---------------------------------------------------------------
        appBar: new AppBar(
            centerTitle: false,
            title: new Text("Signup"),
            leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
                onPressed: (){Navigator.pop(context,true);})
        ),



        //------------- Body---------------------------------------------------------------
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 40.0,),

              // == Full Name======
              appTextField(
                  controller: _FullName,
                  isPassword: false,
                  textInputType: TextInputType.text,
                  sidepadding: 28.0,
                  textHint: "Full Name ",
                  texticon: Icons.person),
              SizedBox(height: 8.0,),
              // == Phone Number ======
              appTextField(
                  controller: _PhoneNumber,
                  isPassword: false,
                  textInputType: TextInputType.phone,
                  sidepadding: 28.0,
                  textHint: "Phone Number ",
                  texticon: Icons.phone),
              SizedBox(height: 8.0,),
              // == Email Address======
              appTextField(
                  controller: _email,
                  textInputType: TextInputType.emailAddress,
                  isPassword: false,
                  sidepadding: 28.0,
                  textHint: "Email Address",
                  texticon: Icons.email),
              SizedBox(height: 8.0,),
              // == TextField  Password=========
              appTextField(
                  controller: _password,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  sidepadding: 28.0,
                  textHint: "Password",
                  texticon: Icons.lock_outline),
              SizedBox(height: 8.0,),
              // == Re_ Password=========
              appTextField(
                  controller: _Re_password,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  sidepadding: 28.0,
                  textHint: "Re_ Password",
                  texticon: Icons.lock_outline),
              SizedBox(height: 20.0,),

              appButton(
                btnTxt: "Create Account ",
                btnPadding: 28.0,
                btnColor: Colors.white,
                onBtnclicked: (){ verifyDetails();},
              ),

              // == Button Login ==============

            ],
          ),
        ),
      ),

    );
  }


  void verifyDetails(){

    if(_FullName.text.isEmpty)
    {showSnackBar("Full Name  Cannot be Empty", scaffoldkey);
    return;}

    if(_PhoneNumber.text.isEmpty)
    {showSnackBar("PhoneNumber  Cannot be Empty", scaffoldkey);
    return;}

    if(_email.text.isEmpty)
    {showSnackBar("Email  Cannot be Empty", scaffoldkey);
    return;}

    if(_password.text.isEmpty)
    {showSnackBar("Password  Cannot be Empty", scaffoldkey);
    return;}

    if(_Re_password.text.isEmpty)
    {showSnackBar("Password  Cannot be Empty", scaffoldkey);
    return;}



    // في حالة كتابة الايميل والباسورد سوف يتم الانتقال الي صفحة الدايلوج
    displayProgressDialog(context);
  }

}



