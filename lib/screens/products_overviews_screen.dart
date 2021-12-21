import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/enums/filter_options.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/widgets/badge.dart';
import 'package:shop_app/widgets/products_grid.dart';

class ProductsOverviewsScreen extends StatefulWidget {
  @override
  _ProductsOverviewsScreenState createState() =>
      _ProductsOverviewsScreenState();
}

class _ProductsOverviewsScreenState extends State<ProductsOverviewsScreen> {
  var _showFavoritesOnly = false;
  @override
  Widget build(BuildContext context) {
    //  final filterProduct = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: [
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showFavoritesOnly = true;

                  // filterProduct._showFavoritesOnly();
                } else {
                  // filterProduct.showAll();
                  _showFavoritesOnly = false;
                }
              });

              // print(selectedValue);
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            
            builder: (context, cartData, ch) => Badge(
              child: ch,
              value: cartData.itemCount.toString(),
            ),
            child: IconButton(
                onPressed: (){
                  Navigator.of(context).pushNamed(CartScreen.id); 
                },
                icon: Icon(Icons.shopping_cart),
              ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGrid(
        showFavs: _showFavoritesOnly,
      ),
    );
  }
}
