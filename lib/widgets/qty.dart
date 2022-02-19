import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

typedef void IntCallback(int val);

class Qty extends StatelessWidget {
  final IntCallback callback;
  final double height;
  final TextStyle? textStyle;
  final int? quantity;
  final double size;

  const Qty(
      {Key? key,
      this.size = 12.0,
      this.textStyle,
      this.height = 16.0,
      required this.callback,
      this.quantity = 1})
      : super(key: key);

  void _add() {
    callback(quantity! + 1);
  }

  void _substract() {
    if (quantity! > 0) {
      callback(quantity! - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          border: Border.all(
            width: 2,
            color: neutralGrey,
          )),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      width: 70,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () => _substract(),
            child: Icon(TablerIcons.minus, size: size, color: neutralBlack),
          ),
          Text("$quantity", style: textStyle ?? bodyText2),
          GestureDetector(
            onTap: () => _add(),
            child: Icon(TablerIcons.plus, size: size, color: neutralBlack),
          ),
        ],
      ),
    );
  }
}
