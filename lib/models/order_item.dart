import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'status_item.dart';
import 'package:gastronomy/extensions/neumorphism.dart';

class OrderField {
  static const createdTime = 'createdTime';
}

class Order {
  String createdTime;
  String icon;
  String title;
  String? id;
  int desk;
  int? status;
  bool? isDone;

  Order({
    required this.createdTime,
    required this.icon,
    required this.title,
    required this.desk,
    this.id,
    this.status,
    this.isDone,
  });
}

class OrderItem extends StatelessWidget {
  final Order? order;

  const OrderItem({Key? key, @required this.order}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: (() {}),
        onDoubleTap: (() {}),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(order!.icon),
                  ),
                  const SizedBox(width: kDefaultPadding / 1.5),
                  Expanded(
                      child: Text.rich(TextSpan(
                          text: order!.title + " \n",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kTextColor,
                          ),
                          children: [
                        TextSpan(
                            text: "Tisch " + order!.desk.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kTextColor))
                      ]))),
                  const StatusItem(),
                  const SizedBox(width: kDefaultPadding / 2),
                  Text(order!.createdTime.toString()),
                ],
              ),
            ).addNeumorphism()
          ],
        ),
      ),
    );
  }
}
