import 'package:flutter/material.dart';
import '../app_data.dart';
import '../app_methods.dart';
import '../app_tools.dart';
import '../firebase_methods.dart';
import 'signup.dart';
import 'package:shoppingapp/userScreens/My_HomePage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController email = new TextEditingController();
  TextEditingController password = new TextEditingController();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  BuildContext context;
  AppMethods appMethod = new FirebaseMethods();

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new Scaffold(
      key: scaffoldKey,

      //--- AppBar-----------------------------------
      appBar: new AppBar(
        title: new Text("Login"),
        centerTitle: false,
        elevation:5.0,
      ),

      //--- body-----------------------------------
      body: new SingleChildScrollView(
        child: new Column(
          children: <Widget>[
            new SizedBox(
              height: 200.0,
            ),

            //==TextField Email Address=======
            appTextField(
                isPassword: false,
                textInputType: TextInputType.emailAddress,
                sidepadding: 30.0,
                textHint: "Email Address",
                texticon: Icons.email,
                controller: email),
            new SizedBox(height: 10.0,),

            //==TextField Password =======
            appTextField(
                isPassword: true,
                sidepadding: 30.0,
                textHint: "Password",
                texticon: Icons.lock,
                controller: password),
            new SizedBox(height: 10.0,),

            //==Button Login=======
            appButton(
              btnTxt: "Create Account ",
              btnPadding: 30.0,
              btnColor: Colors.white,
              onBtnclicked: (){ verifyLoggin();},
            ),
            new SizedBox(height: 20.0,),

            //==text Not Registered? Sign Up Here =======
            new GestureDetector(
              onTap: () {Navigator.of(context).push(
                new MaterialPageRoute(builder: (context) => new SignUp()));},
              child: new Text(
                "Not Registered? Sign Up Here",
                style: new TextStyle(color: Theme.of(context).primaryColor),
              ),),

          ],
        ),
      ),
    );
  }


  verifyLoggin() async {
    // SnackBarاذا كان حقل الايميل فارغ سوف يتم عرض هذا الرسالة في
    if (email.text == "") {
      showSnackBar("Email cannot be empty", scaffoldKey);
      return;
    }

    // SnackBarاذا كان حقل الباسورد  فارغ سوف يتم عرض هذا الرسالة في
    if (password.text == "") {
      showSnackBar("Password cannot be empty", scaffoldKey);
      return;
    }


    // في حالة ادخل المستخدم الايميل والباسورد صحيح سوف يظهر صفحة التحميل لفترة قصيرة وبعدها ينتقل الي البرنامج
    displayProgressDialog(context);
    String response = await appMethod.logginUser(
        email: email.text.toLowerCase(), password: password.text.toLowerCase());
    if (response == successful) {
      closeProgressDialog(context);
      // هنا الصفحة التي سوف يتم الانتقال اليها بعد عملة تسجيل الدخول
      Navigator.push(context, MaterialPageRoute(builder: (context)=> My_HomePage()));
    }

    // وفي حالة
    else {
      closeProgressDialog(context);
      showSnackBar(response, scaffoldKey);
    }
  }
}
