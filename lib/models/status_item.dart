import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class StatusItem extends StatelessWidget {
  const StatusItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      decoration:
          new BoxDecoration(color: HexColor("#58C251"), shape: BoxShape.circle),
    );
  }
}