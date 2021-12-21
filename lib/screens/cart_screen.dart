import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart' show Cart;
import 'package:shop_app/providers/orders.dart';
import 'package:shop_app/widgets/cart_item.dart' as ci;

class CartScreen extends StatelessWidget {
  static const String id = '\cart';
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final totalAmountCart = Provider.of<Cart>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15.0),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20.0),
                  ),
                  Spacer(),
                  Consumer<Cart>(
                    builder: (context, totalValue, child) => Chip(
                      // label: Text(totalValue.totalAmount.toString()),
                      label: Text(
                        '\$${totalValue.totalAmount!.toStringAsFixed(2)}',
                        style: Theme.of(context).primaryTextTheme.headline6,
                      ),
                      backgroundColor: Theme.of(context).primaryColor,
                    ),
                  ),
                  FlatButton(
                      child: Text('Order Now'),
                      onPressed: () {
                        Provider.of<Orders>(context, listen: false).addOrder(
                            totalAmountCart.items!.values.toList(),
                            totalAmountCart.totalAmount);
                            totalAmountCart.clearCart();
                      },
                      textColor: Theme.of(context).primaryColor),
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: totalAmountCart.items!.length,
              itemBuilder: (context, index) => ci.CartItem(
                  productID: totalAmountCart.items!.keys.toList()[index],
                  id: totalAmountCart.items!.values.toList()[index].id,
                  price: totalAmountCart.items!.values.toList()[index].price,
                  quantity:
                      totalAmountCart.items!.values.toList()[index].quantity,
                  title: totalAmountCart.items!.values.toList()[index].title),
            ),
          ),
        ],
      ),
    );
  }
}
