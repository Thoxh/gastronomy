import 'package:flutter/material.dart';
import 'package:gastronomy/provider/orderbuttons.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:gastronomy/provider/sidemenu.dart';
import 'package:gastronomy/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => ActiveWidgetNotifier()),
      ChangeNotifierProvider(create: (context) => OrderProvider()),
      ChangeNotifierProvider(create: (context) => OrderButtonProvider()),
    ],
    child: App(),
  ));
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gastronomy Application',
      theme: ThemeData(),
      home: MainScreen(),
    );
  }
}
