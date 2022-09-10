import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/dialogs/remove_order_dialog.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'status_item.dart';

class Order {
  Timestamp createdTime;
  String icon;
  String title;
  String? id;
  int desk;
  int status;
  bool isDone;

  Order({
    required this.createdTime,
    required this.icon,
    required this.title,
    required this.desk,
    required this.isDone,
    required this.status,
    this.id,
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

class OrderItem extends StatefulWidget {
  final Order? order;

  const OrderItem({Key? key, @required this.order}) : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  Color getColor(Order order) {
    if (order.status == 1) {
      return HexColor("#F5C04E");
    } else if (order.status == 2) {
      return HexColor("#EC6654");
    }
    return HexColor("#58C251");
  }

  final bool _isElevated = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: InkWell(
        onTap: (() {}),
        onDoubleTap: () {
          final provider = Provider.of<OrderProvider>(context, listen: false);
          provider.toggleOrderisDone(widget.order);
        },
        onLongPress: () {
          showDialog(
              context: context,
              builder: (BuildContext context) =>
                  RemoveOrderDialogWidget(order: widget.order));
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding),
              decoration: BoxDecoration(
                color: kBgDarkColor,
                borderRadius: BorderRadius.circular(15),
                boxShadow: _isElevated
                    ? [
                        const BoxShadow(
                          color: Colors.grey,
                          offset: Offset(4, 4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                        const BoxShadow(
                          color: Colors.white,
                          offset: Offset(-4, -4),
                          blurRadius: 15,
                          spreadRadius: 1,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    backgroundImage: AssetImage(widget.order!.icon),
                  ),
                  const SizedBox(width: kDefaultPadding / 1.5),
                  Expanded(
                      child: Text.rich(TextSpan(
                          text: widget.order!.title + " \n",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kTextColor,
                          ),
                          children: [
                        TextSpan(
                            text: (widget.order!.desk != 0)
                                ? "Tisch " + widget.order!.desk.toString()
                                : "Abholung Bar",
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kTextColor))
                      ]))),
                  StatusItem(color: getColor(widget.order!)),
                  const SizedBox(width: kDefaultPadding / 2),
                  Text(DateFormat('HH:mm')
                      .format(widget.order!.createdTime.toDate())),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
