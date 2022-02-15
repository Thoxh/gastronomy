import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import '../provider/orders.dart';

class SideMenuItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SideMenuItem({
    Key? key,
    this.showBorder = true,
    this.textColor,
    this.showBadge = false,
    required this.icon,
    required this.title,
    required this.toggleActiveState,
    required this.activeState,
  }) : super(key: key);

  final bool activeState;
  final bool showBorder;
  final bool showBadge;
  final Icon? icon;
  final String? title;
  final Color? textColor;
  final Function(bool) toggleActiveState;

  @override
  Widget build(BuildContext context) {
    // conncect to order provider
    final provider = Provider.of<OrderProvider>(context);
    // access orders from provider
    final ordersFromProvider = provider.orders;

    return Padding(
      padding: const EdgeInsets.only(top: kDefaultPadding),
      child: InkWell(
        onTap: () {
          toggleActiveState(activeState);
        },
        child: Row(
          children: [
            /*(isActive || isHover)
                ? const Icon(
                    Icons.arrow_right,
                    size: 15,
                    color: kPrimaryColor,
                  )
                : */
            const SizedBox(width: 15),
            const SizedBox(width: kDefaultPadding / 4),
            Expanded(
              child: Container(
                padding: const EdgeInsets.only(bottom: 15, right: 5),
                decoration: showBorder
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(color: Color(0xFFDFE2EF)),
                        ),
                      )
                    : null,
                child: Row(
                  children: [
                    icon!,
                    const SizedBox(width: kDefaultPadding * 0.75),
                    Text(
                      title!,
                      style: Theme.of(context).textTheme.button?.copyWith(
                          color:
                              textColor //activeState ? kTextColor : kGrayColor,
                          ),
                    ),
                    const Spacer(),
                    if (showBadge && ordersFromProvider.length != 0)
                      Badge(
                        animationType: BadgeAnimationType.scale,
                        animationDuration: Duration(milliseconds: 200),
                        badgeContent: Text(
                          ordersFromProvider.length.toString(),
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                        padding: EdgeInsets.all(5.5),
                        badgeColor: kPrimaryColor,
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
