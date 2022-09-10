import 'package:flutter/material.dart';
import 'package:gastronomy/sidemenu/side_menu.dart';
import 'package:provider/provider.dart';

import '../provider/sidemenu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          const Expanded(flex: 2, child: SideMenu()),
          Expanded(
              flex: 6,
              child: Provider.of<ActiveWidgetNotifier>(context).activeWidget),
        ],
      ),
    );
  }
}
