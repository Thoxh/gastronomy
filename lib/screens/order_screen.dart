import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orderbuttons.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:gastronomy/sidemenu/side_menu.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../models/order_button_item.dart';

class Bestellungen extends StatelessWidget {
  Bestellungen({Key? key}) : super(key: key);
  String sortingText = "Sortieren nach Datum";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 250),
        child: SideMenu(),
      ),
      body: Row(
        children: [
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
              color: kBgDarkColor,
              child: SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: kDefaultPadding),
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
                      const SizedBox(
                        height: kDefaultPadding,
                      ),
                      const Expanded(child: OrderList())
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              color: kBgDarkColor,
              padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
              height: double.infinity,
              child: SafeArea(
                child: Column(
                  children: const [
                    ExpansionTile(
                      title: Text(
                        "Favoriten",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      backgroundColor: kBgDarkColor,
                    ),
                    Expanded(child: OrderButtonList())
                  ],
                ),
              ),
            ),
          )
        ],
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

class OrderButtonList extends StatelessWidget {
  const OrderButtonList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // connect to provider
    final provider = Provider.of<OrderButtonProvider>(context);
    // access orderButtons from provider
    final orderButtonsFromProvider = provider.orderButtons;
    return orderButtonsFromProvider.isEmpty
        ? Text(
            "Wähle eine Kategorie aus oder überprüfe deine Verbindung.",
            style: Theme.of(context).textTheme.button?.copyWith(
                color: kTextColor //activeState ? kTextColor : kGrayColor,
                ),
          )
        : Padding(
            padding: const EdgeInsets.only(right: kDefaultPadding),
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3, childAspectRatio: 1 / 1),
                itemCount: orderButtonsFromProvider.length,
                itemBuilder: (context, index) {
                  final orderButton = orderButtonsFromProvider[index];
                  return OrderButtonItem(orderButton: orderButton);
                }),
          );
  }
}
