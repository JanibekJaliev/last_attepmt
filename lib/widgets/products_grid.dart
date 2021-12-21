import 'package:flutter/material.dart';
import 'package:shop_app/providers/products_provider.dart';
import 'package:shop_app/widgets/product_item.dart';
import 'package:provider/provider.dart';

class ProductsGrid extends StatelessWidget {
  final bool? showFavs;
  ProductsGrid({this.showFavs});
  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs == true  ? productsData.favoriteItems : productsData.items  ;
    return GridView.builder(
      padding: EdgeInsets.all(10.0),
      itemCount: products!.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
      ),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        // create: (context) => products[index],
        value:  products[index],
        child: ProductsItem(
          // id: products[index].id!,
          // imageUrl: products[index].imageUrl!,
          // title: products[index].title!,
        ),
      ),
    );
  }
}
