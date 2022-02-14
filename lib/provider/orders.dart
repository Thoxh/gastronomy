import 'package:flutter/cupertino.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:intl/intl.dart';

class OrderProvider extends ChangeNotifier {
  /// Private List containing orders with there parameters
  final List<Order> _orders = [
    Order(
        icon: "assets/icons/Wine.png",
        title: "Weiß Wein Trocken",
        desk: 12,
        createdTime: DateFormat('hh:mm').format(DateTime.now()),
        id: "1",
        isDone: false),
    Order(
        icon: "assets/icons/Beer.png",
        title: "Bier",
        desk: 12,
        createdTime: DateFormat('hh:mm').format(DateTime.now()),
        id: "1",
        isDone: false),
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
        isDone: false),
    Order(
        icon: "assets/icons/Water.png",
        title: "Stilles Wasser",
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
        isDone: false),
    Order(
        icon: "assets/icons/Water.png",
        title: "Stilles Wasser",
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
        isDone: false),
  ];

  /// Getter List for orders to access the elements
  List<Order> get orders =>
      _orders.where((order) => order.isDone == false).toList();

  void addOrder(Order order) {
    _orders.add(order);
    notifyListeners();
  }

  void removeOrder(Order? order) {
    _orders.remove(order);
    notifyListeners();
  }

  bool toggleOrderisDone(Order? order) {
    order!.isDone = !order.isDone;
    notifyListeners();
    return order.isDone;
  }
}
