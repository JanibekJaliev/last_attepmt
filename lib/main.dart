import 'package:flutter/material.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_sceen.dart';
import 'package:shop_app/screens/orders_screen.dart';
import 'package:shop_app/screens/products_detail_screen.dart';
import 'package:shop_app/screens/products_overviews_screen.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/screens/user_products_screen.dart';

import 'providers/products_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Products(),
        ),
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => Orders(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato',
        ),
        // home: Products_overviews_screen(),
        initialRoute: '/',
        routes: {
          '/': (ctx) => ProductsOverviewsScreen(),
          ProductDetailScreen.id: (ctx) => ProductDetailScreen(),
          CartScreen.id: (ctx) => CartScreen(),
          OrdersScreen.id: (_) => OrdersScreen(),
          UserProductsScreen.id: (_) => UserProductsScreen(),
          EditProductScreen.id: (context) => EditProductScreen(),
        },
      ),
    );
  }
}
