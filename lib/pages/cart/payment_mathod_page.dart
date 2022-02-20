import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/payment_method_app_bar.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  Payment selectPayment = Payment(name: "Please Select Payment", image: "");
  String selectPaymentName = '';

  bool isButtonEnabled = false;

  void changeButtonState() {
    if (selectPaymentName != "") {
      setState(() {
        isButtonEnabled = true;
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
        child: Column(
          children: [
            PaymentMethodAppBar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    SizedBox(height: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instant Debit",
                            style: subtitle2.copyWith(color: neutralBlack)),
                        SizedBox(height: 16),
                        ...[
                          ["OneKlik", "assets/icons/oneklik.png"],
                          ["Direct Debit BRI", "assets/icons/bri.png"],
                          ["Direct Debit Mandiri", "assets/icons/mandiri.png"],
                        ]
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectPayment =
                                        Payment(name: e[0], image: e[1]);
                                    selectPaymentName = e[0];
                                  });
                                  changeButtonState();
                                },
                                child: PaymentOption(
                                  isActive: selectPaymentName == e[0],
                                  name: e[0],
                                  image: e[1],
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                    SizedBox(height: 16),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed("/card");
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Credit Card / Debit",
                              style: subtitle2.copyWith(color: neutralBlack)),
                          SizedBox(height: 16),
                          Container(
                            width: double.infinity,
                            margin: EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(
                                      "assets/icons/credit-card 1.svg",
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 24),
                                    Text("Credit Card / Debit", style: button)
                                  ],
                                ),
                                Icon(TablerIcons.chevron_right)
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Instant Debit",
                            style: subtitle2.copyWith(color: neutralBlack)),
                        SizedBox(height: 16),
                        ...[
                          [
                            "BCA Virtual Account",
                            "assets/icons/logo bank bca-01 1.png"
                          ],
                          [
                            "Mandiri Virtual Account",
                            "assets/icons/mandiri.png"
                          ],
                        ]
                            .map(
                              (e) => GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectPayment =
                                        Payment(name: e[0], image: e[1]);
                                    selectPaymentName = e[0];
                                  });
                                  changeButtonState();
                                },
                                child: PaymentOption(
                                  isActive: selectPayment.name == e[0],
                                  name: e[0],
                                  image: e[1],
                                ),
                              ),
                            )
                            .toList()
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 32, left: 24, right: 24),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  if (isButtonEnabled) {
                    Provider.of<PaymentProvider>(context, listen: false)
                        .changePayment(selectPayment);
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        "/cart", ModalRoute.withName("/cart"));
                  }
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Update Payment",
                      style: button.copyWith(
                          color: isButtonEnabled ? neutralWhite : neutralGrey2),
                    ),
                    const SizedBox(width: 10),
                    Icon(TablerIcons.chevron_right,
                        size: 16,
                        color: isButtonEnabled ? neutralWhite : neutralGrey2),
                  ],
                ),
                style: ElevatedButton.styleFrom(
                    primary: isButtonEnabled ? primary50 : neutralGrey,
                    elevation: 0,
                    padding: const EdgeInsets.all(18),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  const PaymentOption({
    Key? key,
    required this.isActive,
    required this.name,
    required this.image,
  }) : super(key: key);

  final bool isActive;
  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image(
                image: AssetImage(image),
                height: 44,
                width: 44,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 24),
              Text(name, style: button)
            ],
          ),
          Toggle(
            isActive: isActive,
          )
        ],
      ),
    );
  }
}

class Toggle extends StatelessWidget {
  const Toggle({
    Key? key,
    required this.isActive,
  }) : super(key: key);

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isActive
          ? "assets/icons/toggle active.svg"
          : "assets/icons/toggle inactive.svg",
      height: 16,
      width: 16,
    );
  }
}
