import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/screens/products_detail_screen.dart';

class ProductsItem extends StatelessWidget {
  // final String? id;
  // final String? imageUrl;
  // final String? title;
  // const ProductsItem({Key? key, this.id, this.imageUrl, this.title})
  //     : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cartItem = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.id,
              arguments: product.id,
            );
          },
          child: Image.network(
            product.imageUrl!,
            fit: BoxFit.cover,
          ),
        ),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (context, productWeWantToListen, child) => IconButton(
              color: Theme.of(context).accentColor,
              onPressed: () {
                productWeWantToListen.toggleFavoriteStatus();
              },
              icon: Icon(productWeWantToListen.isFavorite == true
                  ? Icons.favorite
                  : Icons.favorite_border),
            ),
          ),
          trailing: IconButton(
            color: Theme.of(context).accentColor,
            onPressed: () {
              cartItem.addItem(product.id!, product.price!, product.title!);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'Added Item to Cart',
                    textAlign: TextAlign.center,
                  ),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cartItem.removeSingleItem(product.id!);
                    },
                  ),
                  duration: Duration(seconds: 2),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
          backgroundColor: Colors.black45,
          title: Text(
            product.title!,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
