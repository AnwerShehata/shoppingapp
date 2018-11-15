import 'package:flutter/material.dart';
import './My_SearchData.dart';
import 'My_addProducts.dart';
import 'My_Privilages.dart';
import 'My_appMessages.dart';
import 'My_appUser.dart';
import 'My_appOrders.dart';
import 'My_OrderHistosy.dart';

class My_adminHome extends StatefulWidget {
  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_adminHome> {
  Size screenSize;


  @override
  Widget build(BuildContext context) {
    screenSize = MediaQuery.of(context).size;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(fontFamily: "Cairo"),
      home:  new Scaffold(
        backgroundColor: Colors.teal.shade400,

        //----- AppBar------------------------------------
        appBar: new AppBar(
          title: new Text("App Admin"),
          backgroundColor: Colors.teal.shade400,
          centerTitle: true,
          elevation: 0.0,
          leading: new IconButton(onPressed: (){Navigator.pop(context,true);},
            icon: Icon(Icons.keyboard_arrow_left,size: 35.0,),),
        ),

        //----- endDrawer------------------------------------
        endDrawer: new Container(
          width: screenSize.width-50,
          color: Colors.white,
          child: Column(children: <Widget>[
            // =======DrawerHeader =============================
            new UserAccountsDrawerHeader(
              accountName: new Text("Admin User"),
              accountEmail: new Text("adminEmail@gmail.com"),
              currentAccountPicture: new CircleAvatar(
                backgroundColor: Colors.white,
                child: new Icon(Icons.account_circle ,size: 30.0,),
              ),
            ),


          ],),


        ),


        //----- endDrawer------------------------------------
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: new Column(
            children: <Widget>[

              //======= Row One =======================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _CircleAvatar(
                      name: "Search Data", myIcon: Icons.search,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_SearchData()));}),

                    _CircleAvatar(
                      name: "App Users", myIcon: Icons.people,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_appUser()),);}),
                  ],
                ),
              ),


              //======= Row Two =======================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _CircleAvatar(
                      name: "App Orders", myIcon: Icons.shopping_basket,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_appOrders()),);}),

                    _CircleAvatar(
                      name: "App Messages", myIcon: Icons.chat,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_appMessages()),);}),
                  ],
                ),
              ),


              //======= Row Three =======================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _CircleAvatar(
                      name: "Add Produts", myIcon: Icons.shop_two,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_addProducts()),);}),

                    _CircleAvatar(
                      name: "Add ", myIcon: Icons.add,
                      onBtnclicked: (){},),
                  ],
                ),
              ),

              //======= Row For =======================
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 13.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    _CircleAvatar(
                      name: "Order History", myIcon: Icons.history,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_OrderHistosy()),);}),

                    _CircleAvatar(
                      name: "Privilages", myIcon: Icons.person,
                      onBtnclicked: (){Navigator.push(context, MaterialPageRoute(builder: (context) => My_Privilages()),);}),
                  ],
                ),
              ),



            ],
          ),
        ),

      ),
    );
  }

  GestureDetector _CircleAvatar({String name , IconData myIcon , VoidCallback onBtnclicked }) {
    return GestureDetector(onTap: onBtnclicked,
                child: new CircleAvatar( maxRadius: 70.0,
                  backgroundColor: Colors.teal.shade500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new Icon(myIcon,size: 30.0,color: Colors.white,),
                      SizedBox(height: 10.0, ),
                      new Text(name , style: TextStyle(color: Colors.white),),
                    ],
                  ),),
              );
  }
}