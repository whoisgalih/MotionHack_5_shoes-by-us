import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:shoes_by_us/models/promo_provider.dart';
import 'package:shoes_by_us/models/receipt_model.dart';
import 'package:shoes_by_us/models/shoes_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/payment_success_app_bar.dart';

class PaymentSuccessPage extends StatelessWidget {
  const PaymentSuccessPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
        child: Column(
          children: [
            PaymentSuccessAppBar(
              isGoHome: true,
            ),
            Expanded(
              child: SingleChildScrollView(child:
                  Consumer<ReceiptProvider>(builder: (context, receipt, child) {
                return Column(children: [
                  SizedBox(height: 32),
                  SvgPicture.asset(
                    "assets/icons/Frame 37.svg",
                    height: 24,
                    width: 24,
                  ),
                  SizedBox(height: 16),
                  Text("Payment Successful",
                      style: bodyText2.copyWith(
                        color: primary50,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 10),
                  Text(addDot(receipt.receipts.last.total),
                      style: headline4.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                      )),
                  SizedBox(height: 51),
                  Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(bottom: 13),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Detail Transaction",
                                    style: subtitle2.copyWith(
                                        color: neutralBlack)),
                                Icon(TablerIcons.chevron_up),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Payment Metahods", style: subtitle2),
                                Text(
                                    receipt.receipts.last.payment.image
                                            .contains(".svg")
                                        ? "Debit card ending xxxx ${receipt.receipts.last.payment.number.substring(receipt.receipts.last.payment.number.length - 4)}"
                                        : receipt.receipts.last.payment.name,
                                    style: caption),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Date & Time", style: subtitle2),
                                Text(receipt.receipts.last.date,
                                    style: caption),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Status", style: subtitle2),
                                Text("On Process", style: caption),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 8),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Shipping Methods", style: subtitle2),
                                Text("JNE Bebas Ongkir (2 - 3 hari)",
                                    style: caption),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 33, top: 24),
                            width: double.infinity,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("Total Payment", style: subtitle2),
                                Text(addDot(receipt.receipts.last.total),
                                    style: caption),
                              ],
                            ),
                          )
                        ],
                      )),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed("/track");
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border(
                                top: BorderSide(color: neutralGrey, width: 6),
                                bottom:
                                    BorderSide(color: neutralGrey, width: 6))),
                        padding: const EdgeInsets.symmetric(
                            vertical: 22, horizontal: 24),
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              "assets/icons/Shipment green.svg",
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: 24,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Track your item",
                                      style: subtitle2.copyWith(
                                          color: neutralBlack)),
                                  const SizedBox(height: 8),
                                  Text("See about your item activity process",
                                      style: caption.copyWith(
                                          color: neutralGrey2)),
                                ],
                              ),
                            ),
                            Icon(TablerIcons.chevron_right)
                          ],
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.all(24),
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.of(context)
                            .pushNamedAndRemoveUntil("/home", (route) => false);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Done",
                            style: button.copyWith(color: neutralWhite),
                          ),
                          const SizedBox(width: 10),
                        ],
                      ),
                      style: ElevatedButton.styleFrom(
                          primary: neutralBlack,
                          elevation: 0,
                          padding: const EdgeInsets.all(18),
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(34)),
                          )),
                    ),
                  )
                ]);
              })),
            )
          ],
        ),
      ),
    );
  }
}
