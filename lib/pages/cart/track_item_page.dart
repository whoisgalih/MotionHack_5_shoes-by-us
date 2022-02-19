import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:intl/intl.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/themes/border.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/payment_success_app_bar.dart';
import 'package:shoes_by_us/widgets/shoe/accordion.dart';

class TrackItemPage extends StatelessWidget {
  final isActive = true;
  const TrackItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
        child: Column(
          children: [
            PaymentSuccessAppBar(
              isGoHome: false,
            ),
            SizedBox(height: 32),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 24),
                      padding: EdgeInsets.only(bottom: 24),
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(milliseconds: 500),
                            decoration: decoBorder,
                            curve: Curves.easeInOut,
                            width: double.infinity,
                            padding: EdgeInsets.symmetric(
                                horizontal: 24, vertical: isActive ? 24 : 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text("Receipt number",
                                            style: subtitle2.copyWith(
                                              color: neutralGrey2,
                                            )),
                                        SizedBox(height: 6),
                                        Text("370910002525001",
                                            style: subtitle2.copyWith(
                                              color: neutralBlack,
                                            )),
                                      ],
                                    ),
                                    Icon(TablerIcons.chevron_up,
                                        color: neutralBlack, size: 24)
                                  ],
                                ),
                                isActive ? SizedBox(height: 20) : SizedBox(),
                                isActive
                                    ? Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              DateFormat("dd MMMM, yy")
                                                  .format(DateTime.now()),
                                              style: caption.copyWith(
                                                  color: neutralGrey2)),
                                          SizedBox(height: 6),
                                          Text("Kota Jakarta",
                                              style: button.copyWith(
                                                  color: accent50)),
                                        ],
                                      )
                                    : SizedBox(),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(24),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Track Detail",
                              style: headline6.copyWith(
                                  fontWeight: FontWeight.w600, fontSize: 15)),
                          SizedBox(height: 12),
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
                          SizedBox(height: 24),
                          Image(
                              image:
                                  AssetImage("assets/images/Rectangle 113.png"),
                              height: 141,
                              width: double.infinity)
                        ],
                      ),
                    )
                  ]),
            )),
          ],
        ),
      ),
    );
  }
}
