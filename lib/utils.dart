import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastronomy/models/menubutton_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:provider/provider.dart';

import 'globals.dart';
import 'models/order_item.dart';

class Utils {
  static StreamTransformer<QuerySnapshot<Map<String, dynamic>>, List<T>>
      transformer<T>(T Function(Map<String, dynamic> json) fromJson) =>
          StreamTransformer.fromHandlers(handleData:
              (QuerySnapshot<Map<String, dynamic>> data,
                  EventSink<List<T>> sink) {
            final snaps = data.docs.map((doc) => doc.data()).toList();
            final objects = snaps.map((json) => fromJson(json)).toList();

            sink.add(objects);
          });

  static void checkStatus() async {
    await FirebaseFirestore.instance
        .collection(activeEventOrders)
        .where("isDone", isEqualTo: false)
        .get()
        .then((value) => value.docs.forEach((doc) {
              Timestamp temp = doc.get("createdTime");
              DateTime timeFromDatabase = temp.toDate();
              DateTime now = DateTime.now();
              var minutesDifference =
                  now.difference(timeFromDatabase).inMinutes;
              if (minutesDifference >= 5 && minutesDifference <= 10) {
                doc.reference.update({'status': 1});
              } else if (minutesDifference >= 10) {
                doc.reference.update({'status': 2});
              }
            }));
  }

  static void addOrder(BuildContext context, MenuButton orderButton) {
    final order = Order(
        createdTime: Timestamp.now(),
        icon: orderButton!.icon,
        title: orderButton!.title,
        desk: 0,
        id: "",
        status: 0,
        isDone: false);
    final provider = Provider.of<OrderProvider>(context, listen: false);
    provider.addOrder(order);
  }
}
