import 'package:flutter/material.dart';
import 'package:shoppingapp/userScreens/My_Cart.dart';
import '../Tools/My_Store.dart';

class My_ItemDetails extends StatefulWidget {

  final String itemName;
  final String itemImage;
  final double itemPrice;
  final double itemRating;
  final String itemsuName;

  const My_ItemDetails({Key key,
    this.itemName,
    this.itemImage,
    this.itemPrice,
    this.itemRating,
    this.itemsuName
  }) : super(key: key);

  _BirdState createState() => new _BirdState();
}

class _BirdState extends State<My_ItemDetails> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  new Scaffold(

        //------------- AppBar--------------------------------------------------
        appBar: new AppBar(
            centerTitle: false,
            title: new Text(widget.itemName),
            leading: IconButton(icon: Icon(Icons.keyboard_arrow_left,size: 35.0,color: Colors.white,),
                onPressed: (){Navigator.pop(context,true);})
        ),



        //-----FloatingActionButton-----------------------------------------------
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: new Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            new FloatingActionButton(
              onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=> My_Cart()));},
              child: new Icon(Icons.shopping_cart , size: 20.0,),
              elevation: 0.0,
            ),
            //هنا الدائرة التي تظهر فيها عددالمنتجات التي تم اختيارها عن طريق المستخدم
            new CircleAvatar(
              radius: 10.0,
              backgroundColor: Colors.redAccent,
              child: new Text("0" ,style: TextStyle(color: Colors.white,fontSize: 12.0),),
            )
          ],
        ),


        //------------- BottomAppBar----------------------------------------------
        bottomNavigationBar: BottomAppBar(
          color: Colors.blue,
          shape: CircularNotchedRectangle() ,
          notchMargin:6.0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 17.0),
//            height: 50.0,
//            padding: EdgeInsets.symmetric(horizontal: 20.0 , vertical: 10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new InkWell(onTap: (){}, child: new Text("Add To Favorites" ,style: TextStyle(fontWeight: FontWeight.w600 ,color: Colors.white),),),
                new InkWell(onTap: (){},child: new Text("Order New" , style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white),),),
              ],
            ),
          ),
        ),


        //-----body-------------------------------------------------------------
        body: new Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[

            new Container(
              height: 300.0,
              decoration: new BoxDecoration(
                color: Colors.yellow,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                    image: NetworkImage(widget.itemImage)
                ),
                borderRadius: new BorderRadius.only(
                  bottomRight: Radius.circular(80.0),
                  bottomLeft:Radius.circular(80.0),
                )
              ),
            ),

            new SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: new Column(
                children: <Widget>[
                  new SizedBox(height: 300.0,),
                  // هنا الاسم والسعر والتقيم
                  new Card(
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(height: 10.0,),
                          new Text(widget.itemName, style: new
                          TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),),
                          new SizedBox(height: 10.0,),
                          new Text("Item Sub name", style: new TextStyle(
                              fontSize: 14.0, fontWeight: FontWeight.w400),),
                          new SizedBox(height: 10.0,),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              new Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  new Icon(Icons.star, color: Colors.blue, size: 20.0,),
                                  new SizedBox(width: 5.0,),
                                  new Text("${widget.itemRating}", style: new TextStyle(color: Colors.black),)
                                ],
                              ),
                              new Text("${widget.itemPrice}", style: new
                              TextStyle(fontSize: 20.0, color: Colors.red[500], fontWeight: FontWeight.w700),),
                            ],
                          ),
                          new SizedBox(height: 10.0,),
                        ],
                      ),
                    ),
                  ),

                  //هنا  صور اخري  للمنتج
                  new Card(
                    child: new Container(
                      width: screenSize.width,
                      height: 150.0,
                      child: new ListView.builder(
                        physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: 5,
                          itemBuilder: (context, index) {
                            return new Stack(
                              alignment: Alignment.center,
                              children: <Widget>[
                                new Container(
                                  margin:
                                  new EdgeInsets.only(left: 5.0, right: 5.0),
                                  height: 140.0,
                                  width: 100.0,
                                  child: new Image.network(widget.itemImage,fit: BoxFit.cover,),
                                ),
                                new Container(
                                  margin:
                                  new EdgeInsets.only(left: 5.0, right: 5.0),
                                  height: 140.0,
                                  width: 100.0,
                                  decoration: new BoxDecoration(
                                      color: Colors.grey.withAlpha(50)),
                                ),
                              ],
                            );
                          }),
                    ),
                  ),

                  // هنا وصف المنتج
                  new Card(
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Description",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "My item full information",
                            style: new TextStyle(
                                fontSize: 14.0, fontWeight: FontWeight.w400),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                  // هنا لون المنتج والمقاس
                  new Card(
                    child: new Container(
                      width: screenSize.width,
                      margin: new EdgeInsets.only(left: 20.0, right: 20.0),
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new SizedBox(height: 10.0,),
                          new Text("Colors", style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),),
                          new SizedBox(height: 10.0,),
                          new SizedBox(
                            height: 50.0,
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return new Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: new ChoiceChip(
                                            label: new Text("Color ${index}"),
                                            selected: false),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text("Sizes", style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),),
                          new SizedBox(height: 10.0,),
                          new SizedBox(height: 50.0,
                            child: new ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 4,
                                itemBuilder: (context, index) {
                                  return new Stack(
                                    alignment: Alignment.center,
                                    children: <Widget>[
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: new ChoiceChip(
                                            label: new Text("Sizes ${index}"),
                                            selected: false),
                                      )
                                    ],
                                  );
                                }),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Text(
                            "Sizes",
                            style: new TextStyle(
                                fontSize: 18.0, fontWeight: FontWeight.w700),
                          ),
                          new SizedBox(
                            height: 10.0,
                          ),
                          new Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              new CircleAvatar(
                                child: new Icon(Icons.remove),
                              ),
                              new Text("0"),
                              new CircleAvatar(
                                child: new Icon(Icons.add),
                              ),
                            ],
                          ),
                          new SizedBox(
                            height: 50.0,
                          ),
                        ],
                      ),
                    ),
                  ),

                ],
              ),
            )

          ],
        ),


      ),
    );
  }
}