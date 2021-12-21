import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shop_app/providers/orders.dart' as ord;
import 'package:intl/intl.dart';

class OrderItem extends StatefulWidget {
  final ord.OrderItem? order;
  const OrderItem({Key? key, this.order}) : super(key: key);

  @override
  _OrderItemState createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  bool? _expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10.0),
      child: Column(
        children: [
          ListTile(
            title: Text('\$${widget.order!.amount}'),
            subtitle: Text(
              DateFormat.yMEd().format(widget.order!.dateTime!),
            ),
            trailing: IconButton(
              icon: _expanded == true
                  ? Icon(Icons.expand_less)
                  : Icon(Icons.expand_more),
              onPressed: () {
                setState(() {});
                _expanded = !_expanded!;
              },
            ),
          ),
          if (_expanded!)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 4.0),
                height: min(widget.order!.products!.length * 20.0 + 10, 180),
                child:
                 ListView(
                  children: widget.order!.products!
                      .map((prod) => Row(
                            children: [
                              Text(
                                prod.title!,
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                               '${prod.quantity} x \$${prod.price}'
                              ),
                            ],
                          ))
                      .toList(),
                )
                //  ListView.builder(
                //   itemBuilder: (_, index) => Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //     children:
                //     [
                //       Text(
                //         widget.order!.products![index].title.toString(),
                //         style: TextStyle(
                //           fontSize: 18.0,
                //           fontWeight: FontWeight.bold,
                //         ),
                //       ),
                //       Text(
                //           '${widget.order!.products![index].quantity} x \$${widget.order!.products![index].price}'),
                //     ],
                //   ),
                // ),
                ),
        ],
      ),
    );
  }
}
