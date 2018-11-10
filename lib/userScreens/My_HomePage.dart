import 'package:flutter/material.dart';
import 'My_Favorite.dart';
import 'My_Messages.dart';
import 'My_Cart.dart';
import 'My_Notifications.dart';
import 'My_History.dart';
import 'My_Profile.dart';
import 'My_Delivery.dart';
import 'My_About.dart';
import 'My_Login.dart';

class My_HomePage extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_HomePage> {
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    this.context = context;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        //-----AppBar-----------------------------------------------------------
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          title: Text("GirLies"),
          actions: <Widget>[
            new IconButton(icon: new Icon(Icons.favorite), 
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Favorite()));}
            ),
            //هنا الدائرة التي يظهر فيها عدد الراسائل التي فوق زر الدردشة
            new Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                new IconButton(icon: new Icon(Icons.chat),
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Messages()));}
                    ),
                new CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.redAccent,
                  child: new Text("0" ,style: TextStyle(color: Colors.white,fontSize: 12.0),),
                )
              ],
            )
          ],
        ),


        //-----FloatingActionButton-----------------------------------------------
        floatingActionButton: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new FloatingActionButton(
                onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Cart()));},
              child: new Icon(Icons.shopping_cart , size: 20.0,),
                ),
            //هنا الدائرة التي تظهر فيها عددالمنتجات التي تم اختيارها عن طريق المستخدم
            new CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.redAccent,
              child: new Text("0" ,style: TextStyle(color: Colors.white,fontSize: 12.0),),
            )
          ],
        ),



        //-----FloatingActionButton-----------------------------------------------
        drawer: new Drawer(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Login()));
                },
              ),
            ],
          ),
        ),



        //-----body-------------------------------------------------------------
        body: new Center(
          child: new Text("My Home Page Stor"),
        ),



      ),
    );
  }
}