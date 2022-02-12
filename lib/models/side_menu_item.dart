import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';

class SideMenuItem extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  SideMenuItem({
    Key? key,
    this.itemCount = 0,
    this.showBorder = true,
    this.textColor,
    @required this.icon,
    @required this.title,
    required this.toggleActiveState,
    required this.activeState,
  }) : super(key: key);

  final bool activeState;
  final bool showBorder;
  final int itemCount;
  final Icon? icon;
  final String? title;
  final Color? textColor;
  final Function(bool) toggleActiveState;

  @override
  Widget build(BuildContext context) {
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
                    // if (itemCount != null) CounterBadge(count: itemCount)
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
