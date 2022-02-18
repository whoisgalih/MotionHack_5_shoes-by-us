import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

// typedef void IntCallback(int val);

class QtyStf extends StatefulWidget {
  // final IntCallback callback;
  final double size;
  final TextStyle? textStyle;

  const QtyStf({
    Key? key,
    this.size = 12.0,
    this.textStyle,
    // required this.callback,
  }) : super(key: key);

  @override
  State<QtyStf> createState() => _QtyStfState();
}

class _QtyStfState extends State<QtyStf> {
  int _qty = 1;

  int get quantity => _qty;

  void _add() {
    setState(() {
      _qty += 1;
    });
    // widget.callback(quantity);
  }

  void _substract() {
    if (_qty != 1) {
      setState(() {
        _qty -= 1;
      });
    }
    // widget.callback(quantity);
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
            child:
                Icon(TablerIcons.minus, size: widget.size, color: neutralBlack),
          ),
          Text(_qty.toString(), style: widget.textStyle ?? bodyText2),
          GestureDetector(
            onTap: () => _add(),
            child:
                Icon(TablerIcons.plus, size: widget.size, color: neutralBlack),
          ),
        ],
      ),
    );
  }
}
