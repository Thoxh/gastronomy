import 'package:flutter/material.dart';

import '../screens/order_screen.dart';

class ActiveWidgetNotifier extends ChangeNotifier {
  Widget activeWidget = Bestellungen();
  void changeActiveWidget(Widget newWidget) {
    activeWidget = newWidget;
    notifyListeners();
  }
}
