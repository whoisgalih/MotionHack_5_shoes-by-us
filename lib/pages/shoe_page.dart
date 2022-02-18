import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class ShoePage extends StatelessWidget {
  final Shoes? shoe;

  const ShoePage({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: shoe != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShoePageAppBar(),
                  Image(
                    image: AssetImage(shoe!.image),
                    height: 252,
                    width: double.infinity,
                    fit: BoxFit.fitHeight,
                  ),
                  Container(
                    padding: EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          shoe!.name,
                          textAlign: TextAlign.center,
                          style: bodyText1.copyWith(color: neutralGrey2),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          shoe!.name,
                          textAlign: TextAlign.center,
                          style: headline6.copyWith(
                              fontWeight: FontWeight.w700, color: neutralBlack),
                        ),
                        SizedBox(
                          height: 14,
                        ),
                        Text(
                          "${addDot(shoe!.price)}",
                          style: bodyText1,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

class ShoePageAppBar extends StatelessWidget {
  const ShoePageAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            TablerIcons.chevron_left,
            size: 24,
            color: neutralBlack,
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
