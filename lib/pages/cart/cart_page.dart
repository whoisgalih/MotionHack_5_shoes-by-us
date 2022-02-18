import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
                                  Icon(TablerIcons.chevron_right,
                                      size: 24, color: neutralBlack)
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
                                        Row(children: [
                                          SvgPicture.asset(
                                            "assets/icons/shield 1.svg",
                                            height: 24,
                                            width: 24,
                                          ),
                                          SizedBox(width: 12),
                                          Text("Shipping Insurence",
                                              style: subtitle2.copyWith(
                                                  color: neutralBlack)),
                                        ]),
                                        const SizedBox(height: 8),
                                        Container(
                                          constraints:
                                              BoxConstraints(maxWidth: 241),
                                          child: Text(
                                              "Free guaranteed shipping insurance for your products to your home safely.",
                                              style: caption.copyWith(
                                                  color: neutralGrey2)),
                                        )
                                      ],
                                    ),
                                  ),
                                  SvgPicture.asset(
                                    "assets/icons/checkbox 1.svg",
                                    height: 24,
                                    width: 24,
                                  ),
                                ],
                              )),
                          Container(
                              decoration: decoBorder,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 16),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Row(children: [
                                    SvgPicture.asset(
                                      "assets/icons/discount-2 1.svg",
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 18),
                                    Text("Use Promo If You Have",
                                        style: subtitle2.copyWith(
                                            color: neutralBlack)),
                                  ])),
                                  Icon(TablerIcons.chevron_right,
                                      size: 24, color: neutralBlack)
                                ],
                              )),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: neutralGrey, width: 2))),
                              margin: const EdgeInsets.symmetric(vertical: 24),
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Payment Details",
                                      style: headline6.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 15)),
                                  SizedBox(height: 13),
                                  Container(
                                    width: double.infinity,
                                    child: Column(children: [
                                      PaymentDetailsItem(
                                          title: "Subtotal",
                                          price: shoe!.price),
                                      PaymentDetailsItem(
                                          title: "Shipping", price: 0),
                                      PaymentDetailsItem(
                                          title: "Total", price: shoe!.price),
                                    ]),
                                  )
                                ],
                              )),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: neutralGrey, width: 2))),
                              margin: const EdgeInsets.only(bottom: 24),
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Address Details",
                                                style: button.copyWith(
                                                    color: neutralGrey2)),
                                            SizedBox(height: 4),
                                            Text(
                                                "Jln. Terusan Jakarta No. 11, Kota B...",
                                                style: subtitle2.copyWith(
                                                    color: neutralBlack)),
                                          ],
                                        ),
                                      ),
                                      Icon(TablerIcons.chevron_right,
                                          size: 24, color: neutralBlack)
                                    ],
                                  ),
                                  SizedBox(height: 24),
                                  GestureDetector(
                                    onTap: () => Navigator.of(context)
                                        .pushNamed("/payment-method"),
                                    child: Row(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Color(0x330060AF),
                                              borderRadius:
                                                  BorderRadius.circular(22)),
                                          child: Image(
                                              image: AssetImage(
                                                  "assets/icons/logo bank bca-01 1.png"),
                                              height: 24,
                                              width: 24),
                                        ),
                                        SizedBox(width: 24),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text("Payment Method",
                                                  style: button.copyWith(
                                                      color: neutralGrey2)),
                                              SizedBox(height: 4),
                                              Text("BCA Virtual Account",
                                                  style: subtitle2.copyWith(
                                                      color: neutralBlack)),
                                            ],
                                          ),
                                        ),
                                        Icon(TablerIcons.chevron_right,
                                            size: 24, color: neutralBlack)
                                      ],
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: neutralGrey, width: 2))),
                              margin: const EdgeInsets.only(bottom: 24),
                              padding: const EdgeInsets.only(bottom: 24),
                              child: Text(
                                  "With activating protection feature, I accept to Terms and Conditions that apply")),
                          PaymentDetailsItem(title: "Total", price: 3279000)
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

class PaymentDetailsItem extends StatelessWidget {
  final String title;
  final num price;

  const PaymentDetailsItem({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: subtitle2),
          Text(addDot(price), style: caption),
        ],
      ),
    );
  }
}
