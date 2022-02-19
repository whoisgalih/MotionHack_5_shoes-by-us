import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';

class PaymentSuccessAppBar extends StatelessWidget {
  final bool isGoHome;

  const PaymentSuccessAppBar({
    Key? key,
    required this.isGoHome,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
              onTap: () {
                if (isGoHome) {
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("/home", (route) => false);
                } else {
                  Navigator.of(context).pop();
                }
              },
              child: Icon(TablerIcons.chevron_left,
                  size: 24, color: neutralBlack)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(TablerIcons.capture, size: 24, color: neutralBlack),
              SizedBox(width: 24),
              Icon(TablerIcons.share, size: 24, color: neutralBlack),
            ],
          ),
        ],
      ),
    );
  }
}
