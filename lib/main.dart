import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/UserProductsScreen.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {

    return MultiProvider( //Using for multiple Providers

      providers: [
        ChangeNotifierProvider(create: (BuildContext context) {
          return Products();
        }),

         ChangeNotifierProvider(create: (context) {
           return Cart();
         }),
         ChangeNotifierProvider(create: (context) {
           return Orders();
         }),          
      ],
      child: MaterialApp(
        title: 'Shop App',
        debugShowCheckedModeBanner: false,
        theme:
            ThemeData(
              primarySwatch: Colors.purple,
              //  fontFamily: 'poppins'
              ),
        home: ProductsOverviewScreen(),
        routes: {
          productDetailScreen.routenName: (context) => productDetailScreen(),
          
          CartScreen.routeName:(context)=> CartScreen(),
          
          OrdersScreen.routeName:(context)=>OrdersScreen(),

          UserProductsScreen.routName:(context) =>UserProductsScreen(),

            EditProductScreen.routeName:(context) =>EditProductScreen(),

        },
      ),
    );
  }
}


