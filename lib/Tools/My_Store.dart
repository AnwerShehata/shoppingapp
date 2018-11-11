import 'package:flutter/material.dart';

// Class Data
class My_Store {
  String itemName;
  double itemPrice;
  String itemImage;
  double itemRating;

  My_Store.items(
      {this.itemName,
        this.itemPrice,
        this.itemImage,
        this.itemRating});
}

List<My_Store> StoreItems =[

  My_Store.items(
      itemName: "Anwer shehata",
      itemPrice: 2500.00,
      itemImage: "https://cdn.pixabay.com/photo/2014/05/03/00/50/flower-child-336658__480.jpg",
      itemRating: 5.0),

  My_Store.items(
      itemName: "Black Strip  White ",
      itemPrice: 2499.00,
      itemImage: "https://cdn.pixabay.com/photo/2015/03/04/19/42/woman-659352__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/03/23/08/34/beautiful-1274361__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Black Strip White ",
      itemPrice: 2499.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/11/19/17/11/blond-1840386__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/07/28/10/45/fashion-1547507__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Black Strip White ",
      itemPrice: 2499.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/11/01/03/27/girl-1787357__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://cdn.pixabay.com/photo/2015/10/12/15/09/woman-984244__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Black Strip White ",
      itemPrice: 2499.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/11/23/18/38/beautiful-1854284__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Pink Can",
      itemPrice: 2500.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/11/21/12/27/beautiful-1845052__480.jpg",
      itemRating: 0.0),

  My_Store.items(
      itemName: "Black Strip White",
      itemPrice: 2499.00,
      itemImage: "https://cdn.pixabay.com/photo/2016/03/23/04/11/beautiful-1274064__480.jpg",
      itemRating: 0.0),
];
