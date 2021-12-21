import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/orders.dart' show Orders;

class OrdersScreen extends StatelessWidget {
  static const String id = '/order';

  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final orderData = Provider.of<Orders>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your orders'),
      ),
      //   itemBuilder: (context, index) => OrderItem(
      //     order: orderData.orders[index],
      //   ),
      //   itemCount: orderData.orders.length,
      // ),
    );
  }
}
