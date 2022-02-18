import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class AccordionParent extends StatefulWidget {
  const AccordionParent({
    Key? key,
    required this.shoe,
  }) : super(key: key);

  final Shoes? shoe;

  @override
  State<AccordionParent> createState() => _AccordionParentState();
}

class _AccordionParentState extends State<AccordionParent> {
  List<int> _activeAccordion = [];

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              width: 2,
              color: neutralGrey,
            )),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              if (_activeAccordion.contains(0)) {
                setState(() {
                  _activeAccordion.remove(0);
                });
              } else {
                setState(() {
                  _activeAccordion.add(0);
                });
              }
            },
            child: AccordionChild(
              header: "About Product",
              body: widget.shoe!.desc,
              isActive: _activeAccordion.contains(0),
            ),
          ),
          Container(
            height: 2,
            color: neutralGrey,
          ),
          GestureDetector(
            onTap: () {
              if (_activeAccordion.contains(1)) {
                setState(() {
                  _activeAccordion.remove(1);
                });
              } else {
                setState(() {
                  _activeAccordion.add(1);
                });
              }
            },
            child: AccordionChild(
              header: "Review",
              body: widget.shoe!.desc,
              isActive: _activeAccordion.contains(1),
            ),
          )
        ]));
  }
}

class AccordionChild extends StatelessWidget {
  const AccordionChild({
    Key? key,
    required this.header,
    required this.body,
    required this.isActive,
  }) : super(key: key);

  final String body;
  final bool isActive;
  final String header;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      width: double.infinity,
      padding:
          EdgeInsets.symmetric(horizontal: 24, vertical: isActive ? 24 : 16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(header,
                  style: subtitle2.copyWith(
                    color: isActive ? neutralBlack : neutralGrey2,
                  )),
              Icon(TablerIcons.chevron_down,
                  color: isActive ? neutralBlack : neutralGrey2, size: 24)
            ],
          ),
          isActive ? SizedBox(height: 14) : SizedBox(),
          isActive
              ? Text(body, style: caption.copyWith(color: neutralGrey2))
              : SizedBox(),
        ],
      ),
    );
  }
}
