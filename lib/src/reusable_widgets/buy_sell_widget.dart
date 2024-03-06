import 'package:flutter/material.dart';

class BuySellWidget extends StatelessWidget {
  final String title;
  final Color? boxColor;
  final Color titleColor;
  final VoidCallback tap;

  const BuySellWidget(
      {super.key,
      required this.title,
      required this.boxColor,
      this.titleColor = Colors.black,
      required this.tap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: tap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(0)),
            color: boxColor),
        child: Center(
            child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w400, fontSize: 20, color: titleColor),
        )),
      ),
    );
  }
}
