import 'package:flutter/material.dart';
import 'package:gastronomy/constants.dart';

class OrderFormWidget extends StatelessWidget {
  final String icon;
  final String title;
  final int desk;
  final int status;
  final ValueChanged<String>? onChangedIcon;
  final ValueChanged<String>? onChangedTitle;
  final ValueChanged<String>? onChangedDesk;
  final ValueChanged<int>? onChangedStatus;
  final VoidCallback? onSavedTodo;

  const OrderFormWidget({
    Key? key,
    this.icon = "",
    this.title = "",
    this.desk = 0,
    this.status = 0,
    @required this.onChangedIcon,
    @required this.onChangedTitle,
    @required this.onChangedDesk,
    @required this.onChangedStatus,
    @required this.onSavedTodo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildIcon(),
          buildTitle(),
          buildDesk(),
          SizedBox(
            height: kDefaultPadding,
          ),
          buildButton()
        ],
      ),
    );
  }

  Widget buildIcon() => TextFormField(
        maxLines: 1,
        initialValue: icon,
        onChanged: onChangedIcon,
        validator: (icon) {
          if (icon != null && icon.isEmpty) {
            return 'The icon cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Icon',
        ),
      );

  Widget buildTitle() => TextFormField(
        maxLines: 1,
        initialValue: title,
        onChanged: onChangedTitle,
        validator: (title) {
          if (title != null && title.isEmpty) {
            return 'The title cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Title',
        ),
      );

  Widget buildDesk() => TextFormField(
        maxLines: 1,
        initialValue: desk.toString(),
        onChanged: onChangedDesk,
        validator: (desk) {
          if (desk != null && desk.isEmpty) {
            return 'The desk cannot be empty';
          }
          return null;
        },
        decoration: InputDecoration(
          labelText: 'Tisch',
        ),
      );
  Widget buildButton() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(onPressed: onSavedTodo, child: Text("Hinzufügen")));
}
