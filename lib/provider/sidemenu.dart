import 'package:flutter/material.dart';

import '../screens/order_screen.dart';

class ActiveWidgetNotifier extends ChangeNotifier {
  Widget activeWidget = OrderScreen();
  void changeActiveWidget(Widget newWidget) {
    activeWidget = newWidget;
    notifyListeners();
  }
}
