import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import '../providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const routeName = 'orders';
  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Your Orders',style: TextStyle(fontWeight: FontWeight.bold)),
        ),
        
         drawer: AppDrawer(),
         
        body: ListView.builder(
          itemBuilder: ((context, index) => OrderItem(orderData.orders[index])),
          itemCount: orderData.orders.length,
        )
        );
  }
}
