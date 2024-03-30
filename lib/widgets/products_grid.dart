import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/products_item.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  ProductsGrid(this.showFavs);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);

    final products =showFavs?productsData.favoriteItems: productsData.items;


    return Container(
      margin: EdgeInsets.all( 10),
      child: GridView.builder(
           
          gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
            
            crossAxisCount: 2,
            childAspectRatio: 3 / 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemBuilder: (context, index) {
            return ChangeNotifierProvider.value(
              //Change notifier  aslo clears perious space on screen
              // create:(context)=>products[index],
    
              value: products[ index], //using changenotifierprovider.value because we want to update data in same widget
    
              child: ProductItem(
                  // products[index].id,
                  //   products[index].title,
                  //  products[index].imageUrl),
                  ),
            );
          },
          itemCount: products.length),
    );
  }
}
