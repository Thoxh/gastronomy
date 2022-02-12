import 'package:flutter/cupertino.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:intl/intl.dart';

class OrderProvider extends ChangeNotifier {
  final List<Order> _orders = [
    Order(
      icon: "assets/icons/Wine.png",
      title: "Weiß Wein Trocken",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
      icon: "assets/icons/Beer.png",
      title: "Bier",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
        icon: "assets/icons/Cocktail.png",
        title: "Pina Colada",
        desk: 12,
        createdTime: DateFormat('hh:mm').format(DateTime.now()),
        id: "1",
        isDone: false),
    Order(
      icon: "assets/icons/Water.png",
      title: "Stilles Wasser",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
      icon: "assets/icons/Water.png",
      title: "Stilles Wasser",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
      icon: "assets/icons/Water.png",
      title: "Stilles Wasser",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
      icon: "assets/icons/Water.png",
      title: "Stilles Wasser",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
    Order(
      icon: "assets/icons/Water.png",
      title: "Stilles Wasser",
      desk: 12,
      createdTime: DateFormat('hh:mm').format(DateTime.now()),
      id: "1",
    ),
  ];

  List<Order> get orders => _orders.toList();
}
