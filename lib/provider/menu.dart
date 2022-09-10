import 'package:flutter/material.dart';

import '../models/menubutton_item.dart';

class MenuButtonProvider extends ChangeNotifier {
  /// Private List containing MenuButtons with there parameters.
  final List<MenuButton> _menuButtons = [
    MenuButton(
        icon: "assets/icons/Beer.png", title: "Bier", subtitle: "Normal"),
    MenuButton(
        icon: "assets/icons/Beer.png", title: "Radler", subtitle: "Normal"),
    MenuButton(
        icon: "assets/icons/Beer.png", title: "Diesel", subtitle: "Normal"),
    MenuButton(
        icon: "assets/icons/Wine.png", title: "Rotwein", subtitle: "Trocken"),
    MenuButton(
        icon: "assets/icons/Wine.png", title: "Weißwein", subtitle: "Normal"),
    MenuButton(
        icon: "assets/icons/Wine.png", title: "Weißwein", subtitle: "Spritzig"),
    MenuButton(
        icon: "assets/icons/Water.png", title: "Wasser", subtitle: "Still"),
    MenuButton(
        icon: "assets/icons/Water.png", title: "Wasser", subtitle: "Medium"),
    MenuButton(
        icon: "assets/icons/Cocktail.png",
        title: "Pina Colada",
        subtitle: "Crushed"),
    MenuButton(
        icon: "assets/icons/Coffee.png", title: "Kaffee", subtitle: "Milch"),
    MenuButton(
        icon: "assets/icons/WheatBeer.png", title: "Bier", subtitle: "Schwarz"),
    MenuButton(
        icon: "assets/icons/Tea.png", title: "Tee", subtitle: "Pfefferminz"),
  ];

  /// Getter List for MenuButtons to access the elements
  List<MenuButton> get menuButtons => _menuButtons.toList();
}
