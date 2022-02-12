import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';
import 'package:gastronomy/sidemenu/order_form_widget.dart';

class AddOrderDialogWidget extends StatefulWidget {
  const AddOrderDialogWidget({Key? key}) : super(key: key);

  @override
  _AddOrderDialogWidgetState createState() => _AddOrderDialogWidgetState();
}

class _AddOrderDialogWidgetState extends State<AddOrderDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  String icon = "";
  String title = "";
  String desk = "";
  int status = 0;

  @override
  Widget build(BuildContext context) => AlertDialog(
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Bestellung hinzufügen",
              style: TextStyle(
                  color: kTextColor, fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),
            OrderFormWidget(
              onChangedIcon: (icon) => setState(() => this.icon = icon),
              onChangedTitle: (title) => setState(() => this.title = title),
              onChangedDesk: (desk) => setState(() => this.desk = desk),
              onChangedStatus: (status) => setState(() => this.status = status),
              onSavedTodo: () {},
            )
          ],
        ),
      );
}
