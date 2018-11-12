import 'package:flutter/material.dart';
import './progressdialog.dart';

//===TextField========================
Widget appTextField({
  IconData texticon ,
  String textHint,
  bool isPassword,
  TextInputType textInputType,
  TextEditingController controller  ,
  double sidepadding})
{
  sidepadding ==null? sidepadding= 0.0:  sidepadding;
  textHint == null ? textHint ="": textHint;
textInputType == null ? textInputType== TextInputType.text : textInputType;

  return Padding(
    padding: new EdgeInsets.only(left:  sidepadding  , right:  sidepadding),
    child: new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
      ),
      //===TextField====
      child: new TextField(
        keyboardType: textInputType==null ? TextInputType.text : textInputType,
        controller: controller,
        obscureText: isPassword == null ? false: isPassword,
        decoration: new InputDecoration(
          hintText: textHint,
          prefixIcon: texticon ==null ? new Container(): new Icon(texticon),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0),
          )
        ),
      ),
    ),
  );
}



//===Button========================
Widget appButton(
    {String btnTxt,
      double btnPadding,
      Color btnColor,
      VoidCallback onBtnclicked}) {
  btnTxt == null ? btnTxt == "App Button" : btnTxt;
  btnPadding == null ? btnPadding = 0.0 : btnPadding;
  btnColor == null ? btnColor = Colors.black : btnColor;

  return Padding(
    padding: new EdgeInsets.only(left: btnPadding , right: btnPadding),
    child: new RaisedButton(
      color: Colors.blue,
      elevation: 0.0,
      shape: new RoundedRectangleBorder(
          borderRadius: new BorderRadius.all(new Radius.circular(15.0))),
      onPressed: onBtnclicked,
      child: Container(
        height: 50.0,
        child: new Center(
          child: new Text(
            btnTxt,
            style: new TextStyle(color: btnColor, fontSize: 18.0),
          ),
        ),
      ),
    ),
  );
}


//===showSnackBar========================
showSnackBar(String message, final scaffoldKey ) {
  scaffoldKey.currentState.showSnackBar(new SnackBar(
    content: new Text(message, style: new TextStyle(color: Colors.white ,fontSize: 17.0),),
    duration: new Duration(seconds: 2),    // هنا الفترة التي سوف تظهر فيها الرساله
    backgroundColor:Colors.redAccent.shade700 ,
    action: new  SnackBarAction(label: 'ok', onPressed: (){}),
  ));
}



//===displayProgressDialog========================
displayProgressDialog(BuildContext context) {
  Navigator.of(context).push(new PageRouteBuilder(
      opaque: false,
      pageBuilder: (BuildContext context, _, __) {
        return new ProgressDialog();
      }));
}

closeProgressDialog(BuildContext context) {
  Navigator.of(context).pop();
}
