import 'package:flutter/material.dart';
import 'My_Favorite.dart';
import 'My_Messages.dart';
import 'My_Cart.dart';
import '../My_Drawer.dart';
import 'My_ItemDetails.dart';
import '../Tools/My_Store.dart';

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



        //-----drawer-----------------------------------------------
        drawer: My_Drawer(),



        //-----body-------------------------------------------------------------
        body: new Center(
          child: new Column(
            children: <Widget>[
              
              new Flexible(
                  child: new GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                    itemCount: StoreItems.length,
                    itemBuilder: (BuildContext context ,int index){

                    return GestureDetector(
                      // عند الضغط علي اي عنصر سوف يتم الانتقال الي صفحة المنتج
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder:
                          (context)=> My_ItemDetails(
                            itemImage: StoreItems[index].itemImage,
                            itemName: StoreItems[index].itemName,
                            itemPrice: StoreItems[index].itemPrice,
                            itemRating: StoreItems[index].itemRating,
                          ))); },

                      child: new Card(
                        child:  Stack(
                          alignment: FractionalOffset.topLeft,
                          children: <Widget>[

                            new Stack(
                              alignment: FractionalOffset.bottomCenter,
                              children: <Widget>[

                                //هنا كود الصورة
                                new Container(
                                  decoration: new BoxDecoration(
                                    image: DecorationImage(fit: BoxFit.cover,
                                        image: NetworkImage(StoreItems[index].itemImage)
                                    ),
                                  ),
                                ),

                                // هنا كود اسم المنتج والسعر
                                new Container(
                                  height: 35.0,
                                  color: Colors.black.withAlpha(100),
                                  child: new  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: new Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[

                                        new Text("${StoreItems[index].itemName.substring(0,8)}..." ,
                                          style: TextStyle(fontSize: 16.0 ,color: Colors.white),),

                                        new Text("N${StoreItems[index].itemPrice}" ,
                                          style: TextStyle(color: Colors.amber.shade500),),
                                      ],
                                    ),
                                  ),
                                )

                              ],
                            ),

                            //  هنا كود التقييم والمفضلة
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                new Container(
                                  height: 30.0,
                                  width: 50.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                      borderRadius: BorderRadius.only(
                                        topRight: new Radius.circular(6.0),
                                        bottomRight: new Radius.circular(6.0),
                                      )
                                  ),
                                  child: new Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      new Icon(Icons.star , color: Colors.yellow, size: 18.0,),
                                      new Text("${StoreItems[index].itemRating}" ,
                                        style: TextStyle(color: Colors.white),)
                                    ],
                                  ),
                                ),
                                new IconButton(icon: Icon(Icons.favorite_border,size: 25.0 , color: Colors.red,),
                                    onPressed: (){}),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );

                    },
              )
              )
              
            ],
          ),
        ),



      ),
    );
  }
}