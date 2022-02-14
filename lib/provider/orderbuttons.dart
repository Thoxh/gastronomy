import 'package:flutter/material.dart';
import 'package:gastronomy/models/order_button_item.dart';

class OrderButtonProvider extends ChangeNotifier {
  /// Private List containing OrderButtons with there parameters.
  final List<OrderButton> _orderButtons = [
    OrderButton(
        icon: "assets/icons/Beer.png", title: "Bier", subtitle: "Normal"),
    OrderButton(
        icon: "assets/icons/Beer.png", title: "Radler", subtitle: "Normal"),
    OrderButton(
        icon: "assets/icons/Beer.png", title: "Diesel", subtitle: "Normal"),
    OrderButton(
        icon: "assets/icons/Wine.png", title: "Rotwein", subtitle: "Trocken"),
    OrderButton(
        icon: "assets/icons/Wine.png", title: "Weißwein", subtitle: "Normal"),
    OrderButton(
        icon: "assets/icons/Wine.png", title: "Weißwein", subtitle: "Spritzig"),
    OrderButton(
        icon: "assets/icons/Water.png", title: "Wasser", subtitle: "Still"),
    OrderButton(
        icon: "assets/icons/Water.png", title: "Wasser", subtitle: "Medium"),
    OrderButton(
        icon: "assets/icons/Cocktail.png",
        title: "Pina Colada",
        subtitle: "Crushed"),
    OrderButton(
        icon: "assets/icons/Coffee.png", title: "Kaffee", subtitle: "Milch"),
    OrderButton(
        icon: "assets/icons/WheatBeer.png", title: "Bier", subtitle: "Schwarz"),
    OrderButton(
        icon: "assets/icons/Tea.png", title: "Tee", subtitle: "Pfefferminz"),
  ];

  /// Getter List for orderButtons to access the elements
  List<OrderButton> get orderButtons => _orderButtons.toList();
}
