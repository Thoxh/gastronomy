import 'package:flutter/material.dart';

import '../screens/bestellungen.dart';

class ActiveWidgetNotifier extends ChangeNotifier {
  Widget activeWidget = Bestellungen();
  void changeActiveWidget(Widget newWidget) {
    activeWidget = newWidget;
    notifyListeners();
  }
}
