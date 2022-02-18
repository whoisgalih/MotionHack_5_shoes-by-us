import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class ShoePageAppBar extends StatelessWidget {
  const ShoePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      color: neutralWhite,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Icon(
              TablerIcons.chevron_left,
              size: 24,
              color: neutralBlack,
            ),
          ),
          Text(
            "Shoes By Us",
            style: appBarBrandTitle,
          ),
          Icon(
            TablerIcons.shopping_cart,
            size: 24,
            color: neutralBlack,
          ),
        ],
      ),
    );
  }
}
