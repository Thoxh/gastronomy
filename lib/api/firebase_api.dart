import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gastronomy/Utils.dart';
import 'package:gastronomy/globals.dart' as globals;

import '../models/order_item.dart';

class FirebaseApi {
  static Future<String> addOrder(Order order) async {
    final docOrder =
        FirebaseFirestore.instance.collection(globals.activeEventOrders).doc();
    order.id = docOrder.id;
    await docOrder.set(order.toJson()).then((result) {
      print("Upload was sucessful.");
    });
    return docOrder.id;
  }

  static Stream<List<Order>> readOrders() => FirebaseFirestore.instance
      .collection(globals.activeEventOrders)
      .snapshots()
      .transform(Utils.transformer(Order.fromJson));

  static Future updateOrder(Order order) async {
    final docOrder = FirebaseFirestore.instance
        .collection(globals.activeEventOrders)
        .doc(order.id);
    await docOrder.update(order.toJson());
  }

  static Future deleteOrder(Order order) async {
    final docOrder = FirebaseFirestore.instance
        .collection(globals.activeEventOrders)
        .doc(order.id);
    await docOrder.delete();
  }
}
