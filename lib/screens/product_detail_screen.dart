import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import '../providers/products.dart';

class productDetailScreen extends StatelessWidget {
  static const routenName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context)!.settings.arguments as String; //Is Id
    final loadedProduct = Provider.of<Products>(context,listen: false).findById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(loadedProduct.title,
          style: TextStyle(fontSize: 26, ),
        )
        ),
      ),
      body:
       SingleChildScrollView(
         child: 
         
         Column(
           children: [
             Container(
              margin: EdgeInsets.all( 11),
              height: 300,
              width: double.infinity,
              child: Image.network(loadedProduct.imageUrl,fit: BoxFit.cover,),
             ),
             SizedBox(height: 10),
              Text('Price : \$${loadedProduct.price}',style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold,color: Colors.blue.shade300)),
             SizedBox(height: 10),
             Text(
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.normal),
              loadedProduct. description,
              textAlign: TextAlign.center,
              softWrap: true,
              
             )
           ],
         ),
       ),

    );
  }
}
