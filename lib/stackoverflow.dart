/*import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:provider/provider.dart';

class OrderList extends StatelessWidget {
  const OrderList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OrderProvider>(context);
    final ordersFromProvider = provider.orders;

    return ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 1.5),
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final order = ordersFromProvider[index];
          return OrderItem(order: order);
        },
        itemCount: ordersFromProvider.length);
  }
}

class OrderProvider extends ChangeNotifier {
  /// Private List filled by setOrders()
  List<Order> _orders = [];

  /// Getter list for orders to access the elements with isDone = false
  List<Order> get orders =>
      _orders.where((order) => order.isDone == false).toList();

  /// Getter list for orders to access the elements with isDone = true
  List<Order> get doneOrders =>
      _orders.where((order) => order.isDone == true).toList();

  void addOrder(Order order) {
    FirebaseApi.addOrder(order);
  }

  void removeOrder(Order? order) {
    FirebaseApi.deleteOrder(order!);
  }

  bool toggleOrderisDone(Order? order) {
    order!.isDone = !order.isDone;
    FirebaseApi.updateOrder(order);
    return order.isDone;
  }

  int toggleOrderStatus(Order? order, int i) {
    order!.status = i;
    FirebaseApi.updateOrder(order);
    return order.status;
  }

  void setOrders(List<Order> orders) {
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      _orders = orders;
      notifyListeners();
    });
  }
}
*/