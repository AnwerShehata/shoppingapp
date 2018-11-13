import 'package:flutter/material.dart';
import '../app_data.dart';
import '../app_methods.dart';
import '../app_tools.dart';
import '../firebase_methods.dart';
import 'package:shoppingapp/userScreens/My_HomePage.dart';


class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController FullName = new TextEditingController();
  TextEditingController PhoneNumber = new TextEditingController();
  TextEditingController Email = new TextEditingController();
  TextEditingController Password = new TextEditingController();
  TextEditingController Re_password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      key: scaffoldKey,

      //-----AppBar-----------------------------
      appBar: new AppBar(
        title: new Text("Sign Up"),
        centerTitle: false,
        elevation: 0.0,
      ),


      //-----body-------------------------------
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            SizedBox(height: 30.0,),

            // == Full Name======
            appTextField(
                controller: FullName,
                isPassword: false,
                textInputType: TextInputType.text,
                sidepadding: 30.0,
                textHint: "Full Name ",
                texticon: Icons.person),
            SizedBox(height: 8.0,),

            // == Phone Number ======
            appTextField(
                controller: PhoneNumber,
                isPassword: false,
                textInputType: TextInputType.phone,
                sidepadding: 30.0,
                textHint: "Phone Number ",
                texticon: Icons.phone),
            SizedBox(height: 8.0,),

            // == Email Address======
            appTextField(
                controller: Email,
                textInputType: TextInputType.emailAddress,
                isPassword: false,
                sidepadding: 30.0,
                textHint: "Email Address",
                texticon: Icons.email),
            SizedBox(height: 8.0,),

            // == TextField  Password=========
            appTextField(
                controller: Password,
                textInputType: TextInputType.text,
                isPassword: true,
                sidepadding: 30.0,
                textHint: "Password",
                texticon: Icons.lock_outline),
            SizedBox(height: 8.0,),

            // == Re_ Password=========
            appTextField(
                controller: Re_password,
                textInputType: TextInputType.text,
                isPassword: true,
                sidepadding: 30.0,
                textHint: "Re_ Password",
                texticon: Icons.lock_outline),
            SizedBox(height: 8.0,),

            appButton(
              btnTxt: "Create Account ",
              btnPadding: 30.0,
              btnColor: Colors.white,
              onBtnclicked: (){ verifyDetails();},
            ),
            // == Button Login ==============
          ],
        ),
      ),
    );
  }

  verifyDetails() async {
    if (FullName.text == "") {
      showSnackBar("Full name cannot be empty", scaffoldKey);
      return;
    }

    if (PhoneNumber.text == "") {
      showSnackBar("Phone cannot be empty", scaffoldKey);
      return;
    }

    if (Email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    if (Password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }

    if (Re_password.text == "") {
      showSnackBar("Re-Password cannot be empty", scaffoldKey);
      return;
    }

    if (Password.text != Re_password.text) {
      showSnackBar("Passwords don't match", scaffoldKey);
      return;
    }

    displayProgressDialog(context);
    String response = await appMethod.createUserAccount(
        fullname: FullName.text,
        phone: PhoneNumber.text,
        email: Email.text.toLowerCase(),
        password: Password.text.toLowerCase());

    if (response == successful) {
      closeProgressDialog(context);
//      Navigator.of(context).pop();
//      Navigator.of(context).pop(true);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> My_HomePage()));
    } else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
