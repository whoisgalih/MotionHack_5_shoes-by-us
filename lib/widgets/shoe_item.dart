import 'package:flutter/material.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/pages/shoe_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class ShoeItem extends StatelessWidget {
  const ShoeItem({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  final Shoes shoe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (builder) => ShoePage(
                shoe: shoe,
              ))),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              color: neutralGrey,
              width: 2,
            )),
        child: Column(
          children: [
            Image(
              image: AssetImage(shoe.image),
              height: 100,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    shoe.name,
                    textAlign: TextAlign.center,
                    style: bodyText2.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w700,
                        color: neutralBlack),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "${addDot(shoe.price)}",
                    style: caption.copyWith(color: neutralBlack),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
