import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gastronomy/api/firebase_api.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:gastronomy/sidemenu/side_menu.dart';
import 'package:provider/provider.dart';

import '../lists/order_list.dart';
import '../lists/orderbutton_list.dart';

class OrderScreen extends StatelessWidget {
  OrderScreen({Key? key}) : super(key: key);
  String sortingText = "Sortieren nach Datum";

  @override
  Widget build(BuildContext context) {
    return Row(
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
                    Expanded(
                        child: StreamBuilder<List<Order>>(
                            stream: FirebaseApi.readOrders(),
                            builder: ((context, snapshot) {
                              switch (snapshot.connectionState) {
                                case ConnectionState.waiting:
                                  return const Center(
                                    child: CircularProgressIndicator(),
                                  );
                                default:
                                  if (snapshot.hasError) {
                                    print(snapshot.error);
                                    return const Text(
                                        "Irgendetwas ist schief gelaufen.");
                                  } else {
                                    if (snapshot.hasData) {
                                      final orders = snapshot.data;
                                      final provider =
                                          Provider.of<OrderProvider>(context);
                                      provider.setOrders(orders!);
                                      return const OrderList();
                                    } else {
                                      return const Text(
                                          "Überprüfe die Verbindung");
                                    }
                                  }
                              }
                            })))
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
    );
  }
}
