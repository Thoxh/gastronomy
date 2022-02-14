import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/dialogs/remove_order_dialog.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:gastronomy/sidemenu/add_order_dialog.dart';
import 'package:provider/provider.dart';
import 'status_item.dart';
import 'package:gastronomy/extensions/neumorphism.dart';

class Order {
  String createdTime;
  String icon;
  String title;
  String? id;
  int desk;
  int? status;
  bool isDone;

  Order({
    required this.createdTime,
    required this.icon,
    required this.title,
    required this.desk,
    required this.isDone,
    this.id,
    this.status,
  });

  Map<String, dynamic> toJson() => {
        'createdTime': createdTime,
        'icon': icon,
        'title': title,
        'id': id,
        'desk': desk,
        'status': status,
        'isDone': isDone,
      };

  static Order fromJson(Map<String, dynamic> json) => Order(
      createdTime: json['createdTime'],
      icon: json['icon'],
      title: json['title'],
      id: json['id'],
      desk: json['desk'],
      status: json['status'],
      isDone: json['isDone']);
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
        onDoubleTap: () {
          final provider = Provider.of<OrderProvider>(context, listen: false);
          final isDone = provider.toggleOrderisDone(order);
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  RemoveOrderDialogWidget(order: order));
        },
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
                            text: (order!.desk != 0)
                                ? "Tisch " + order!.desk.toString()
                                : "Abholung Bar",
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
