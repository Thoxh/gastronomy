import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/models/order_item.dart';
import 'package:gastronomy/provider/orders.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class OrderButton {
  String icon;
  String title;
  String subtitle;

  OrderButton({
    required this.icon,
    required this.title,
    required this.subtitle,
  });
}

class OrderButtonItem extends StatelessWidget {
  final OrderButton? orderButton;

  /// define data of the order and send it to the provider to add it to the list
  void addOrder(BuildContext context) {
    final order = Order(
        createdTime: DateFormat('hh:mm').format(DateTime.now()),
        icon: orderButton!.icon,
        title: orderButton!.title,
        desk: 0,
        id: "",
        status: 0,
        isDone: false);
    final provider = Provider.of<OrderProvider>(context, listen: false);
    provider.addOrder(order);
  }

  const OrderButtonItem({Key? key, @required this.orderButton})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          vertical: kDefaultPadding / 2, horizontal: kDefaultPadding / 2.5),
      child: InkWell(
        onTap: () {
          /// Add an order with data from OrderButtons
          addOrder(context);
        },
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(kDefaultPadding / 1.5),
              decoration: BoxDecoration(
                  color: kBgLightColor,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(width: 1, color: Colors.grey.shade200)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage(orderButton!.icon),
                      ),
                      Spacer(),
                      Container(
                        height: 18,
                        width: 18,
                        decoration: BoxDecoration(
                            color: HexColor("#3186D4"), shape: BoxShape.circle),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  FittedBox(
                      child: Text.rich(TextSpan(
                          text: orderButton!.title + "\n",
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: kTextColor,
                          ),
                          children: [
                        TextSpan(
                            text: orderButton!.subtitle,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                ?.copyWith(color: kTextColor))
                      ]))),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
