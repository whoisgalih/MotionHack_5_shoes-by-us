import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/address_provider.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:shoes_by_us/models/promo_provider.dart';
import 'package:shoes_by_us/models/receipt_model.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/models/shoes_provider.dart';
import 'package:shoes_by_us/themes/border.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/cart_page_app_bar.dart';
import 'package:shoes_by_us/widgets/qty.dart';
import 'package:shoes_by_us/widgets/qty_stf.dart';

class CartPage extends StatefulWidget {
  const CartPage({
    Key? key,
  }) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  Payment? _payment;
  Address? _address;

  // void changeButtonState() {
  //   if (_payment != null && _address != null) {
  //     setState(() {
  //       isButtonEnabled = true;
  //     });
  //   } else {
  //     setState(() {
  //       isButtonEnabled = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // changeButtonState();
    // Provider.of<ShoesProvider>(context).clearAll();
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CartPageAppBar(),
            // SizedBox(
            //   height: 32,
            // ),
            Consumer<ShoesProvider>(builder: (context, cart, child) {
              if (cart.shoes.isEmpty) {
                return Expanded(
                  child: SizedBox(
                    width: double.infinity,
                    height: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                            padding: EdgeInsets.all(30),
                            child: Icon(
                              TablerIcons.shopping_cart,
                              size: 120,
                              color: green2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: green1,
                            )),
                        SizedBox(height: 42),
                        Text("Cart is empty", style: headline5),
                        SizedBox(height: 18),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/home", (route) => false);
                          },
                          child: Text(
                            "Go get some shoes",
                            style: button.copyWith(color: neutralWhite),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: primary50,
                              elevation: 0,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 24),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              }

              num subtotal = cart.totalPrice;
              return Consumer<PromoProvider>(builder: (context, promo, child) {
                num totalDiscount = 0;
                num afterDiscount = 0;
                if (promo.selectedPromo != null) {
                  totalDiscount = promo.calculateDiscount(
                      promo.selectedPromo!.percent, subtotal);
                  afterDiscount = promo.calculatePriceAfterDiscount(
                      promo.selectedPromo!.percent, subtotal);
                }
                return Consumer<PaymentProvider>(
                    builder: (context, payment, child) {
                  _payment = payment.payment;

                  return Consumer<AddressProvider>(
                      builder: (context, address, child) {
                    _address = address.address;

                    return Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 32),
                          width: double.infinity,
                          child: Column(
                            children: [
                              Column(children: [
                                ...cart.shoes
                                    .asMap()
                                    .entries
                                    .map((entry) => CartShoe(
                                        shoe: entry.value,
                                        isLast:
                                            entry.key == cart.shoes.length - 1))
                                    .toList(),
                              ]),
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
                                                        decoration:
                                                            TextDecoration
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
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 24),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 24),
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushNamed("/promo");
                                },
                                child: Container(
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
                                          Text(
                                              promo.selectedPromo != null
                                                  ? "${promo.selectedPromo!.name.toUpperCase()} ${promo.selectedPromo!.percent}%"
                                                  : "Use Promo If You Have",
                                              style: subtitle2.copyWith(
                                                  color: neutralBlack,
                                                  fontWeight:
                                                      promo.selectedPromo !=
                                                              null
                                                          ? FontWeight.w700
                                                          : FontWeight.w500))
                                        ])),
                                        Icon(TablerIcons.chevron_right,
                                            size: 24, color: neutralBlack)
                                      ],
                                    )),
                              ),
                              Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              color: neutralGrey, width: 2))),
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 24),
                                  padding: const EdgeInsets.only(bottom: 16),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              price: subtotal,
                                            ),
                                            PaymentDetailsItem(
                                                title: "Shipping", price: 0),
                                            (totalDiscount != 0)
                                                ? PaymentDetailsItem(
                                                    title: "Discount",
                                                    price: totalDiscount)
                                                : SizedBox(),
                                            PaymentDetailsItem(
                                                title: "Total",
                                                price: (totalDiscount == 0)
                                                    ? subtotal
                                                    : afterDiscount),
                                          ]))
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
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context)
                                              .pushNamed("/address");
                                        },
                                        child: Row(
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
                                                      address.address != null
                                                          ? "${address.address!.address} ${address.address!.addressDetail} "
                                                          : "Please input address",
                                                      style: subtitle2.copyWith(
                                                          color: neutralBlack),
                                                      overflow:
                                                          TextOverflow.ellipsis)
                                                ],
                                              ),
                                            ),
                                            Icon(TablerIcons.chevron_right,
                                                size: 24, color: neutralBlack)
                                          ],
                                        ),
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
                                                  color: payment.payment.image
                                                          .contains(".svg")
                                                      ? green1
                                                      : Color(0x330060AF),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          22)),
                                              child: payment.payment.image
                                                      .contains(".svg")
                                                  ? SvgPicture.asset(
                                                      payment.payment.image,
                                                      height: 24,
                                                      width: 24,
                                                    )
                                                  : Image(
                                                      image: AssetImage(payment
                                                          .payment.image),
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
                                                  Text(payment.payment.name,
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
                              Container(
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("Total", style: button),
                                    Text(
                                        addDot((totalDiscount == 0)
                                            ? subtotal
                                            : afterDiscount),
                                        style: subtitle2.copyWith(
                                            color: accent50)),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 24),
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (_payment != null && _address != null) {
                                      Provider.of<ReceiptProvider>(context,
                                              listen: false)
                                          .addReceipt(
                                              (totalDiscount == 0)
                                                  ? subtotal
                                                  : afterDiscount,
                                              payment.payment);
                                      Navigator.of(context)
                                          .pushNamedAndRemoveUntil(
                                              "/payment-success",
                                              (route) => false);

                                      Provider.of<ShoesProvider>(context,
                                              listen: false)
                                          .clearAll();
                                    }
                                    ;
                                  },
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Pay",
                                        style: button.copyWith(
                                            color: _payment != null &&
                                                    _address != null
                                                ? neutralWhite
                                                : neutralGrey2),
                                      ),
                                      const SizedBox(width: 10),
                                      Icon(TablerIcons.chevron_right,
                                          size: 16,
                                          color: _payment != null &&
                                                  _address != null
                                              ? neutralWhite
                                              : neutralGrey2),
                                    ],
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary:
                                          _payment != null && _address != null
                                              ? primary50
                                              : neutralGrey,
                                      elevation: 0,
                                      padding: const EdgeInsets.all(18),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  });
                });
              });
            })
          ],
        ),
      ),
    );
  }
}

class CartShoe extends StatelessWidget {
  const CartShoe({
    Key? key,
    required this.shoe,
    required this.isLast,
  }) : super(key: key);

  final Shoes shoe;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(bottom: isLast ? 0 : 24),
      margin: EdgeInsets.only(bottom: isLast ? 0 : 24),
      decoration: isLast
          ? BoxDecoration()
          : BoxDecoration(
              border: Border(
                  bottom: BorderSide(
              color: neutralGrey,
              width: 2,
            ))),
      child: Row(
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
              image: AssetImage(shoe.image),
              fit: BoxFit.fitHeight,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              height: 114,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        shoe.name,
                        style: subtitle2.copyWith(color: neutralBlack),
                      ),
                      const SizedBox(height: 2),
                      Text("Size: ${shoe.selectedSize} (US)",
                          style: caption.copyWith(color: neutralGrey2))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Qty(
                          quantity: shoe.quantity,
                          callback: (val) {
                            if (val == 0) {
                              Provider.of<ShoesProvider>(context, listen: false)
                                  .removeShoes(shoe);
                            } else {
                              shoe.quantity = val;
                              Provider.of<ShoesProvider>(context, listen: false)
                                  .editShoes(shoe);
                            }
                          }),
                      Text(
                        "${addDot(shoe.afterDisountPrice)}",
                        style: caption.copyWith(color: neutralBlack),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
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
