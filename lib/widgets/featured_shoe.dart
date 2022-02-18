import 'package:flutter/material.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/pages/shoe_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class FeaturedShoe extends StatelessWidget {
  FeaturedShoe({
    Key? key,
    required Shoes? featuredShoe,
  })  : _featuredShoe = featuredShoe,
        super(key: key);

  final Shoes? _featuredShoe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (builder) => ShoePage(
                shoe: _featuredShoe,
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
              image: AssetImage(_featuredShoe!.image),
              height: 190,
              width: double.infinity,
              fit: BoxFit.fitHeight,
            ),
            Container(
              padding: EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _featuredShoe!.name,
                    style: subtitle2.copyWith(color: neutralBlack),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "${addDot(_featuredShoe!.discountPercent == 0 ? _featuredShoe!.price : (_featuredShoe!.price * (1 - _featuredShoe!.discountPercent / 100)))}",
                            style: caption.copyWith(color: neutralBlack),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Text(
                            _featuredShoe!.discountPercent == 0
                                ? ""
                                // : "${_featuredShoe!.price}",
                                : "${addDot(_featuredShoe!.price).replaceAll(",", ".")}",
                            style: caption.copyWith(
                                color: neutralGrey2,
                                decoration: TextDecoration.lineThrough),
                          )
                        ],
                      ),
                      Text(
                        "${_featuredShoe!.discountPercent}% off",
                        style: caption.copyWith(color: primary50),
                      )
                    ],
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
