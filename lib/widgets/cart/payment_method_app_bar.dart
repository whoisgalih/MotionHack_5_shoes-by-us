import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class PaymentMethodAppBar extends StatelessWidget {
  const PaymentMethodAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
              Text('Payment Methods', style: headline6)
            ],
          ),
        ],
      ),
    );
  }
}
