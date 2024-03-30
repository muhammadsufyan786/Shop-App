import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart';
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';


class CartScreen extends StatelessWidget {
  static const routeName = '/cart';
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(
      appBar: AppBar(
        title:  Text('Your Cart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700)),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    // label: Text('\$${cart.totalAmount.toString()}'),
                    label: Text('\$${cart.totalAmount.toStringAsFixed(2)}',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                 
                  TextButton(
                    child: Text('ORDER NOW',style: TextStyle(fontWeight: FontWeight.w700)),
                 
                    onPressed: () {
                      Provider.of<Orders>(context,listen: false).addOrder(
                          cart.items.values.toList(),
                           cart.totalAmount
                           );
                            cart.clear();
                    },
                      style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.purple.shade400,
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => CartItem(
                cart.items.values.toList()[i].id,
                cart.items.keys.toList()[i],
                cart.items.values.toList()[i].price,
                cart.items.values.toList()[i].quantity,
                cart.items.values.toList()[i].title,
              ),
            ),
          )
        ],
      ),
    );
  }
}
