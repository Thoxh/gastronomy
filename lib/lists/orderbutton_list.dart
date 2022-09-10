import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../models/menubutton_item.dart';
import '../provider/menu.dart';

/// Build-Methode of the OrderButton-ListView
class OrderButtonList extends StatelessWidget {
  const OrderButtonList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MenuButtonProvider>(context);
    final orderButtonsFromProvider = provider.menuButtons;
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
                  return MenuButtonItem(orderButton: orderButton);
                }),
          );
  }
}
