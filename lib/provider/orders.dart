import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:intl/intl.dart';
import 'package:gastronomy/api/firebase_api.dart';

class OrderProvider extends ChangeNotifier {
  /// Private List containing orders with there parameters
  List<Order> _orders = [];

  /// Getter list for orders to access the elements with isDone = false
  List<Order> get orders =>
      _orders.where((order) => order.isDone == false).toList();

  /// Getter list for orders to access the elements with isDone = true
  List<Order> get doneOrders =>
      _orders.where((order) => order.isDone == true).toList();

  void addOrder(Order order) {
    /// Firebase logic
    FirebaseApi.addOrder(order);

    /// Local logic
    /*_orders.add(order);
    notifyListeners(); */
  }

  void removeOrder(Order? order) {
    FirebaseApi.deleteOrder(order!);

    /// Local logic
    /*_orders.remove(order);
    notifyListeners();*/
  }

  bool toggleOrderisDone(Order? order) {
    order!.isDone = !order.isDone;
    FirebaseApi.updateOrder(order);
    //notfiyListeners();
    return order.isDone;
  }

  int toggleOrderStatus(Order? order, int i) {
    order!.status = i;
    FirebaseApi.updateOrder(order);
    return order.status;
  }

  void setOrders(List<Order> orders) {
    // update app after build is complete - would cause problems with the provider without
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _orders = orders;
      notifyListeners();
    });
  }
}
