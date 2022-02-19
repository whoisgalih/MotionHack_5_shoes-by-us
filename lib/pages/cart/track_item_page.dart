import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/cart/payment_success_app_bar.dart';

class TrackItemPage extends StatelessWidget {
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
            Expanded(
                child: SingleChildScrollView(
              child: Column(children: []),
            )),
          ],
        ),
      ),
    );
  }
}
