import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String  description;
  final double price;
  final String imageUrl;
  bool isFavourite = false;

  Product(
      {required this.id,
      required this.title,
      required this. description,
      required this.price,
      required this.imageUrl,
      required this.isFavourite});

  void toggleFavouriteStatue() {  //For togling Heart Icon
    isFavourite = !isFavourite;
    notifyListeners();
  }
}
