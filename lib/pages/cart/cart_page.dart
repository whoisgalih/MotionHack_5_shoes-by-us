import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/themes/border.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/cart_page_app_bar.dart';
import 'package:shoes_by_us/widgets/qty_stf.dart';

class CartPage extends StatelessWidget {
  final Shoes? shoe;
  const CartPage({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: shoe != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CartPageAppBar(),
                  // SizedBox(
                  //   height: 32,
                  // ),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 32),
                      width: double.infinity,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(17),
                                height: 114,
                                width: 114,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  color: neutralGrey,
                                ),
                                child: Image(
                                  image: AssetImage(shoe!.image),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Container(
                                  height: 114,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            shoe!.name,
                                            style: subtitle2.copyWith(
                                                color: neutralBlack),
                                          ),
                                          const SizedBox(height: 2),
                                          Text(
                                              "Size: ${shoe!.selectedSize} (US)",
                                              style: caption.copyWith(
                                                  color: neutralGrey2))
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const QtyStf(),
                                          Text(
                                            "${addDot(shoe!.discountPercent == 0 ? shoe!.price : (shoe!.price * (1 - shoe!.discountPercent / 100)))}",
                                            style: caption.copyWith(
                                                color: neutralBlack),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              decoration: decoBorder,
                              margin: const EdgeInsets.only(top: 32),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(children: [
                                        Text("Shipping ",
                                            style: subtitle2.copyWith(
                                                color: neutralBlack)),
                                      ]),
                                      const SizedBox(height: 8),
                                      Text("Time Estimated 24- 2 February",
                                          style: caption.copyWith(
                                              color: neutralGrey2))
                                    ],
                                  )),
                                  const Icon(TablerIcons.chevron_right)
                                ],
                              )),
                          Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          color: neutralGrey, width: 2),
                                      bottom: BorderSide(
                                          color: neutralGrey, width: 2))),
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              padding: const EdgeInsets.symmetric(vertical: 24),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Wrap(
                                          direction: Axis.horizontal,
                                          children: [
                                            Text("Bebas Ongkir (",
                                                style: subtitle1.copyWith(
                                                    color: neutralBlack)),
                                            Text("${addDot(20000)} ",
                                                style: subtitle1.copyWith(
                                                    decoration: TextDecoration
                                                        .lineThrough)),
                                            Text("${addDot(0)})",
                                                style: subtitle1.copyWith(
                                                    color: neutralBlack)),
                                          ]),
                                      const SizedBox(height: 8),
                                      Text("Time Estimated 24- 2 February",
                                          style: caption.copyWith(
                                              color: neutralGrey2))
                                    ],
                                  )),
                                  const Icon(TablerIcons.chevron_right)
                                ],
                              ))
                        ],
                      ),
                    ),
                  ))
                ],
              )
            : const SizedBox(
                child: Text("noShoe"),
              ),
      ),
    );
  }
}
