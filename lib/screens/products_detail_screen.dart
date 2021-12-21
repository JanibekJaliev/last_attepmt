// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shop_app/providers/products_provider.dart';

// class ProductsDetailScreen extends StatelessWidget {
//   static const routeName = '/ProductsDetailScreen';

//   @override
//   Widget build(BuildContext context) {
//     final productID = ModalRoute.of(context)?.settings.arguments as String;
//     final loadedProduct =
//         Provider.of<ProductsProvider>(context, listen: false ).findById(productID);
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(loadedProduct!.title!),
//       ),
//       body: Center(
//         child: Text(loadedProduct.description!),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  static const String id = 'Product';

  @override
  Widget build(BuildContext ctx) {
    final productId = ModalRoute.of(ctx)!.settings.arguments as String;
    final loadedProducts =
        Provider.of<Products>(ctx, listen: false).findByID(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedProducts.title!),
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 300.0,
            child: Image.network(
              loadedProducts.imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            '\$ = ${loadedProducts.price}',
            style: TextStyle(color: Colors.grey, fontSize: 20.0),
          ),
          SizedBox(
            height: 10.0,
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10.0 ),
            color: Colors.red,
            width: double.infinity,
              child: Text(
            loadedProducts.description!,
            textAlign: TextAlign.center,
            softWrap: true,
          )),
        ],
      ),
    );
  }
}
