import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/order_item.dart';
import '../provider/orders.dart';

/// Build-Methode of the Order-ListView
class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final ordersFromProvider = provider.orders;

    return ordersFromProvider.isEmpty
        ? Text(
            "Keine Bestellungen vorhanden.",
            style: Theme.of(context).textTheme.button?.copyWith(
                color: kTextColor //activeState ? kTextColor : kGrayColor,
                ),
          )
        : ListView.builder(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final order = ordersFromProvider[index];
              return OrderItem(order: order);
            },
            itemCount: ordersFromProvider.length);
  }
}
