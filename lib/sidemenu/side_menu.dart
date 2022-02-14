// ignore_for_file: deprecated_member_use, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/extensions/neumorphism.dart';
import 'package:gastronomy/screens/order_screen.dart';
import 'package:gastronomy/screens/statistic_screen.dart';
import 'package:gastronomy/sidemenu/add_order_dialog.dart';
import 'package:gastronomy/models/side_menu_item.dart';
import 'package:gastronomy/screens/archive_screen.dart';
import 'package:provider/provider.dart';

import '../provider/sidemenu.dart';

class SideMenu extends StatefulWidget {
  SideMenu({Key? key, this.changeWidget}) : super(key: key);
  final Function(Widget)? changeWidget;

  @override
  State<SideMenu> createState() => SideMenuState();
}

class SideMenuState extends State<SideMenu> {
  List<bool> isActiveList = [true, false, false, false, false];
  bool isActive = false;

  void clearIsActiveList() {
    for (int i = 0; i < isActiveList.length; i++) {
      isActiveList[i] = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      padding: const EdgeInsets.only(top: kIsWeb ? kDefaultPadding : 0),
      color: kBgLightColor,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: Column(children: [
            // SideMenuHeader(),
            SizedBox(height: kDefaultPadding),
            AddButton(
              buttonText: "Neue Bestellung",
              buttonBackgroundColor: kPrimaryColor,
              press: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AddOrderDialogWidget());
              },
              textColor: Colors.white,
              icon: Icon(
                Icons.add,
                color: Colors.white,
                size: 16,
              ),
              topShadowColor: Colors.white,
              bottomShadowColor: Color(0xFF234395).withOpacity(0.2),
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            AddButton(
              buttonText: "Nachrichten",
              buttonBackgroundColor: kBgDarkColor,
              press: () {},
              textColor: kTextColor,
              icon: Icon(
                Icons.message,
                color: kTextColor,
                size: 16,
              ),
              topShadowColor: Colors.white60,
              bottomShadowColor: Color(0x26234395),
            ),
            SizedBox(
              height: kDefaultPadding * 2,
            ),
            SideMenuItem(
                icon: Icon(
                  Icons.inbox,
                  size: 20,
                  color: isActiveList[0] ? kPrimaryColor : kGrayColor,
                ),
                activeState: isActive,
                textColor: isActiveList[0] ? kTextColor : kGrayColor,
                title: "Bestellungen",
                toggleActiveState: (activeState) {
                  Provider.of<ActiveWidgetNotifier>(context, listen: false)
                      .changeActiveWidget(Bestellungen());
                  clearIsActiveList();
                  setState(() {
                    isActiveList[0] = !activeState;
                  });
                }),
            SideMenuItem(
              icon: Icon(
                Icons.archive_outlined,
                size: 20,
                color: isActiveList[1] ? kPrimaryColor : kGrayColor,
              ),
              activeState: isActive,
              textColor: isActiveList[1] ? kTextColor : kGrayColor,
              title: "Archiv",
              toggleActiveState: (activeState) {
                Provider.of<ActiveWidgetNotifier>(context, listen: false)
                    .changeActiveWidget(Archiv());
                clearIsActiveList();
                setState(() {
                  isActiveList[1] = !activeState;
                });
              },
            ),
            SideMenuItem(
              icon: Icon(
                Icons.analytics_outlined,
                size: 20,
                color: isActiveList[2] ? kPrimaryColor : kGrayColor,
              ),
              activeState: isActive,
              textColor: isActiveList[2] ? kTextColor : kGrayColor,
              title: "Statistik",
              toggleActiveState: (activeState) {
                Provider.of<ActiveWidgetNotifier>(context, listen: false)
                    .changeActiveWidget(Statistik());
                clearIsActiveList();
                setState(() {
                  isActiveList[2] = !activeState;
                });
              },
            ),
            SideMenuItem(
              icon: Icon(
                Icons.assignment_outlined,
                size: 20,
                color: isActiveList[3] ? kPrimaryColor : kGrayColor,
              ),
              activeState: isActive,
              showBorder: false,
              textColor: isActiveList[3] ? kTextColor : kGrayColor,
              title: "Rechnung",
              toggleActiveState: (activeState) {
                Provider.of<ActiveWidgetNotifier>(context, listen: false)
                    .changeActiveWidget(Statistik());
                clearIsActiveList();
                setState(() {
                  isActiveList[3] = !activeState;
                });
              },
            ),
            Spacer(),
            SideMenuItem(
              icon: Icon(
                Icons.settings_outlined,
                size: 20,
                color: isActiveList[4] ? kPrimaryColor : kGrayColor,
              ),
              activeState: isActive,
              showBorder: false,
              textColor: isActiveList[4] ? kTextColor : kGrayColor,
              title: "Einstellungen",
              toggleActiveState: (activeState) {
                Provider.of<ActiveWidgetNotifier>(context, listen: false)
                    .changeActiveWidget(Statistik());
                clearIsActiveList();
                setState(() {
                  isActiveList[4] = !activeState;
                });
              },
            )
          ]),
        ),
      ),
    );
  }
}

class SideMenuHeader extends StatelessWidget {
  const SideMenuHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/icons/icon.png",
          height: 46,
        ),
        Spacer(),
        Text(
          "Gastronomy",
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
        )
      ],
    );
  }
}

class AddButton extends StatelessWidget {
  const AddButton(
      {Key? key,
      @required this.buttonBackgroundColor,
      @required this.buttonText,
      @required this.textColor,
      @required this.icon,
      this.topShadowColor,
      this.bottomShadowColor,
      @required this.press})
      : super(key: key);

  final Color? buttonBackgroundColor;
  final String? buttonText;
  final VoidCallback? press;
  final Color? textColor;
  final Icon? icon;
  final Color? topShadowColor;
  final Color? bottomShadowColor;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 40,
        width: double.infinity,
        child: TextButton.icon(
          icon: icon!,
          label: Text(
            buttonText!,
            style: TextStyle(color: textColor),
          ),
          onPressed: press,
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            backgroundColor: buttonBackgroundColor,
          ),
        ).addNeumorphism(
          topShadowColor: topShadowColor!,
          bottomShadowColor: bottomShadowColor!,
        ));
  }
}
