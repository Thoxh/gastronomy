import 'package:flutter/material.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class RemoveOrderDialogWidget extends StatelessWidget {
  final Order? order;
  const RemoveOrderDialogWidget({Key? key, required this.order})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget cancelButton = TextButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Text("Abbrechen"));
    Widget continueButton = TextButton(
        onPressed: () {
          final provider = Provider.of<OrderProvider>(context, listen: false);
          provider.removeOrder(order);
          Navigator.of(context).pop();
        },
        child: const Text("Löschen"));
    return AlertDialog(
      title: const Text(
        "Bestellung entfernen?",
        style: TextStyle(
            color: kTextColor, fontWeight: FontWeight.bold, fontSize: 16),
      ),
      content: const Text(
          "Diese Bestellung wird nicht mehr in der Rechnung, \ndem Archiv oder woanders abgelegt sein."),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
  }
}
