import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context); //method of extracting data

    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: GestureDetector(
              //To Open Image on Tap
              onTap: () {
                Navigator.of(context).pushNamed(productDetailScreen.routenName,
                    arguments: product.id);
              },
              child: Image.network(product.imageUrl, fit: BoxFit.cover)),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: Consumer<Product>(
              builder: (context, Product,
                      child) => // Here we Use Consumer to change in widget without rebuilt also work as same Provider.of<Product>.(context)

                  IconButton(
                      onPressed: () {
                        product.toggleFavouriteStatue();
                      },
                      icon: Icon(product.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_outline_outlined),
                      color: Colors.orangeAccent),
            ),
            title: Text(product.title, textAlign: TextAlign.center),
            trailing: IconButton(
                onPressed: () {
                  cart.addItem(product.id, product.title, product.price);

                  ScaffoldMessenger.of(context).hideCurrentSnackBar(); //For rapidly Showing snack bar

                  ScaffoldMessenger.of(context).showSnackBar(
                    //In videos Scaffold.of(context).showSnackBar but now code update to ScaffoldMessenger

                    SnackBar(
                      
                      content: Text('Added an Item!'),
                      // duration: Duration(seconds: 2),
                      action: SnackBarAction(
                        label: 'UNDO',
                        textColor: Colors.white,
                        onPressed: () {
                          cart.removeSingleItem(product.id);
                        },
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.shopping_cart),
                color: Colors.orangeAccent),
          )),
    );
  }
}
