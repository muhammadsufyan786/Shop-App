// import 'package:flutter/material.dart';
// import 'package:shop_app/widgets/cart_item.dart';


import 'package:flutter/foundation.dart';

import './cart.dart';


class OrderItem {
  final String id;
  final double amount;
  List<CartItem> products;
  final DateTime dateTime;

  OrderItem(
      {required this.id,
      required this.amount,
      required this.products,
      required this.dateTime});
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
        0,
        OrderItem(
             id: DateTime.now().toString(),
            // id: DateTime.now().toIso8601String(),
            amount: total,
            products: cartProducts,
            dateTime: DateTime.now()));
  }

  notifyListeners();
}

