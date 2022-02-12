import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:gastronomy/sidemenu/side_menu.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Bestellungen extends StatelessWidget {
  Bestellungen({Key? key}) : super(key: key);
  String sortingText = "Sortieren nach Datum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Container(
        padding: EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.keyboard_arrow_down,
                      size: 16,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      sortingText,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const Spacer(),
                    MaterialButton(
                      minWidth: 20,
                      onPressed: () {},
                      child: const Icon(Icons.sort_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: kDefaultPadding,
                ),
                Expanded(child: OrderList())
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // conncect to order provider
    final provider = Provider.of<OrderProvider>(context);
    // access orders from provider
    final ordersFromProvider = provider.orders;

    return ordersFromProvider.isEmpty
        ? Text(
            "Keine Bestellungen vorhanden.",
            style: Theme.of(context).textTheme.button?.copyWith(
                color: kTextColor //activeState ? kTextColor : kGrayColor,
                ),
          )
        : ListView.builder(
            padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              final order = ordersFromProvider[index];
              return OrderItem(order: order);
            },
            itemCount: ordersFromProvider.length);
  }
}
