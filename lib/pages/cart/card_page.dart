import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/formater/replace_every.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

class CardPage extends StatefulWidget {
  const CardPage({Key? key}) : super(key: key);

  @override
  State<CardPage> createState() => _CardPageState();
}

class _CardPageState extends State<CardPage> {
  final TextEditingController _numberController = TextEditingController();
  final TextEditingController _expireController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  bool isButtonEnabled = false;

  void changeButtonState() {
    if (_numberController.text.length == 19 &&
        _expireController.text.length == 5 &&
        _cvvController.text.length == 3) {
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
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: Icon(TablerIcons.chevron_left,
                              size: 24, color: neutralBlack)),
                      const SizedBox(width: 24),
                      Text('Add Card', style: headline6)
                    ],
                  ),
                  SvgPicture.asset(
                    "assets/icons/shield 1 blue.svg",
                    height: 24,
                    width: 24,
                  ),
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                // height: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 35),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Number",
                          style: subtitle2.copyWith(color: neutralBlack),
                        ),
                        const SizedBox(height: 12),
                        TextField(
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            ReplaceEvery(every: 4, replacemnt: " "),
                          ],
                          maxLength: 19,
                          keyboardType: TextInputType.number,
                          onChanged: (text) {
                            changeButtonState();
                          },
                          controller: _numberController,
                          decoration: InputDecoration(
                            counterText: "",
                            filled: true,
                            fillColor: textField,
                            hintText: 'XXXX XXXX XXXX XXXX',
                            hintStyle: button.copyWith(color: textFieldHint),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide(
                                style: BorderStyle.solid,
                                color: accent50,
                                width: 2.5,
                              ),
                            ),
                            contentPadding: const EdgeInsets.only(
                                top: 17, bottom: 17, right: 32),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 32, right: 24),
                              child: isButtonEnabled
                                  ? SvgPicture.asset(
                                      "assets/icons/credit-card 3.svg",
                                      height: 24,
                                      width: 24,
                                    )
                                  : Icon(TablerIcons.credit_card,
                                      color: neutralGrey2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Expire Date",
                                    style:
                                        subtitle2.copyWith(color: neutralBlack),
                                  ),
                                  const SizedBox(height: 12),
                                  TextField(
                                    inputFormatters: [
                                      FilteringTextInputFormatter.digitsOnly,
                                      ReplaceEvery(every: 2, replacemnt: "/"),
                                    ],
                                    maxLength: 5,
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (text) {
                                      changeButtonState();
                                    },
                                    controller: _expireController,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      filled: true,
                                      fillColor: textField,
                                      hintText: 'MM/YY',
                                      hintStyle:
                                          button.copyWith(color: textFieldHint),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: accent50,
                                          width: 2.5,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 24,
                                          top: 17,
                                          bottom: 17,
                                          right: 32),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 16.5),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "CVV",
                                    style:
                                        subtitle2.copyWith(color: neutralBlack),
                                  ),
                                  const SizedBox(height: 12),
                                  TextField(
                                    maxLength: 3,
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) {
                                      changeButtonState();
                                    },
                                    controller: _cvvController,
                                    decoration: InputDecoration(
                                      counterText: "",
                                      filled: true,
                                      fillColor: textField,
                                      hintText: 'XXX',
                                      hintStyle:
                                          button.copyWith(color: textFieldHint),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide.none,
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: BorderSide(
                                          style: BorderStyle.solid,
                                          color: accent50,
                                          width: 2.5,
                                        ),
                                      ),
                                      contentPadding: const EdgeInsets.only(
                                          left: 24,
                                          top: 17,
                                          bottom: 17,
                                          right: 32),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              if (isButtonEnabled) {
                                Provider.of<PaymentProvider>(context,
                                        listen: false)
                                    .changePayment(Payment(
                                        name:
                                            "Card xxxx ${_numberController.text.substring(_numberController.text.length - 4)}",
                                        image: "assets/icons/credit-card 1.svg",
                                        cvv: _cvvController.text,
                                        number: _numberController.text,
                                        expireDate: _expireController.text));

                                Navigator.of(context).pushNamedAndRemoveUntil(
                                    "/cart", ModalRoute.withName("/home"));
                              }
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Add Card",
                                  style: button.copyWith(
                                      color: isButtonEnabled
                                          ? neutralWhite
                                          : neutralGrey2),
                                ),
                                const SizedBox(width: 10),
                                Icon(TablerIcons.chevron_right,
                                    size: 16,
                                    color: isButtonEnabled
                                        ? neutralWhite
                                        : neutralGrey2),
                              ],
                            ),
                            style: ElevatedButton.styleFrom(
                                primary:
                                    isButtonEnabled ? primary50 : neutralGrey,
                                elevation: 0,
                                padding: const EdgeInsets.all(18),
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8)),
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        RichText(
                          text: TextSpan(
                              text: "By proceed more further, you agreed to ",
                              style: caption,
                              children: [
                                TextSpan(
                                    text: "Terms and conditions.",
                                    style: caption.copyWith(
                                        color: primary50,
                                        fontWeight: FontWeight.w700))
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
