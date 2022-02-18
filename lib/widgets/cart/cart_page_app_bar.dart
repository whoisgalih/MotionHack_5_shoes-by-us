import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class CartPageAppBar extends StatelessWidget {
  const CartPageAppBar({
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
          Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(
                  TablerIcons.chevron_left,
                  size: 24,
                  color: neutralBlack,
                ),
              ),
              SizedBox(width: 24),
              Text(
                "My Cart",
                style: appBarBrandTitle,
              ),
            ],
          ),
          Row(
            children: [
              Icon(
                Icons.favorite_border_outlined,
                size: 24,
                color: neutralBlack,
              ),
              SizedBox(width: 24),
              SvgPicture.asset(
                "assets/icons/user-circle 2.svg",
                height: 24,
                width: 24,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
