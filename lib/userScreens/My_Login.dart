import 'package:flutter/material.dart';
import '../Tools/My_AppTools.dart';
import 'My_Signup.dart';

class My_Login extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_Login> {

  TextEditingController _email = new TextEditingController();
  TextEditingController _password = new TextEditingController();
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
          title: new Text("Login"),
          leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
              onPressed: (){Navigator.pop(context,true);})
        ),



        //------------- Body---------------------------------------------------------------
        body: new SingleChildScrollView(
          child: new Column(
            children: <Widget>[
              SizedBox(height: 40.0,),

              // == TextField Email Address======
              appTextField(
                controller: _email,
                textInputType: TextInputType.emailAddress,
                isPassword: false,
                sidepadding: 28.0,
                textHint: "Email Address",
                texticon: Icons.email
              ),
              SizedBox(height: 10.0,),

              // == TextField  Password=========
              appTextField(
                controller: _password,
                  textInputType: TextInputType.text,
                  isPassword: true,
                  sidepadding: 28.0,
                  textHint: "Password",
                  texticon: Icons.lock_outline
              ),
              SizedBox(height: 20.0,),

              // == Button Login ==============
              appButton(
                btnTxt: "Login",
                btnPadding: 28.0,
                btnColor: Colors.white,
                onBtnclicked: (){ verifyLoggin();},
              ),
              SizedBox(height: 10.0,),

              // == Text Registered Sign =======
              new GestureDetector(
                onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Signup()));},
                child: new Text("Not Registered Sign up Here" , style: TextStyle(color: Theme.of(context).primaryColor),),
              ),


            ],
          ),
        ),
      ),

    );
  }


    void verifyLoggin(){
    if(_email.text.isEmpty)
    {showSnackBar("Email Cannot be Empty", scaffoldkey);
    return;}

    if(_password.text.isEmpty)
    {showSnackBar("password Cannot be Empty", scaffoldkey);
    return;}

    // في حالة كتابة الايميل والباسورد سوف يتم الانتقال الي صفحة الدايلوج
    displayProgressDialog(context);
    }

    }



