import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class PaymentMethodPage extends StatefulWidget {
  const PaymentMethodPage({Key? key}) : super(key: key);

  @override
  State<PaymentMethodPage> createState() => _PaymentMethodPageState();
}

class _PaymentMethodPageState extends State<PaymentMethodPage> {
  String selectPayment = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
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
                          onTap: () => setState(() {
                            selectPayment = e[0];
                          }),
                          child: PaymentOption(
                            isActive: false,
                            name: e[0],
                            image: e[1],
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
              SizedBox(height: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Instant Debit",
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
                            Text("OneKlik", style: button)
                          ],
                        ),
                        Icon(TablerIcons.chevron_right)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Instant Debit",
                      style: subtitle2.copyWith(color: neutralBlack)),
                  SizedBox(height: 16),
                  ...[
                    ["BCA Virtual Account", "assets/icons/bca.png"],
                    ["Mandiri Virtual Account", "assets/icons/mandiri.png"],
                  ]
                      .map(
                        (e) => GestureDetector(
                          onTap: () => setState(() {
                            selectPayment = e[0];
                          }),
                          child: PaymentOption(
                            isActive: false,
                            name: e[0],
                            image: e[1],
                          ),
                        ),
                      )
                      .toList()
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
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
                image: AssetImage("assets/icons/oneklik.png"),
                height: 44,
                width: 44,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(width: 24),
              Text("OneKlik", style: button)
            ],
          ),
          Toggle(
            isActive: true,
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
