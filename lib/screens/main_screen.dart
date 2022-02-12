import 'package:flutter/material.dart';
import 'package:gastronomy/responsive.dart';
import 'package:gastronomy/sidemenu/side_menu.dart';
import 'package:provider/provider.dart';

import '../provider/sidemenu.dart';

class MainScreen extends StatelessWidget {
  // final GlobalKey<SideMenuState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      body: Row(
        children: [
          Expanded(flex: 3, child: SideMenu()),
          Expanded(
              flex: 5,
              child: Provider.of<ActiveWidgetNotifier>(context).activeWidget),
          Expanded(flex: 5, child: Container()),
        ],
      ),
    );
  }
}
