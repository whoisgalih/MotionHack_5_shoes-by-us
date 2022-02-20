import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/models/promo_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final TextEditingController _promoCodeController = TextEditingController();

  Promo? _promo;

  int selectedSize = 0;
  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Icon(TablerIcons.chevron_left,
                          size: 24, color: neutralBlack)),
                  const SizedBox(width: 24),
                  Text('Promo', style: headline6)
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 32),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextField(
                                  controller: _promoCodeController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: textField,
                                    hintText: 'Input your promo code',
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
                                    contentPadding: const EdgeInsets.symmetric(
                                        horizontal: 24, vertical: 16),
                                  ),
                                ),
                              ),
                              SizedBox(width: 16),
                              ElevatedButton(
                                onPressed: () {},
                                child: Text(
                                  "Apply",
                                  style: button.copyWith(color: neutralWhite),
                                ),
                                style: ElevatedButton.styleFrom(
                                    primary: primary50,
                                    elevation: 0,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 32, vertical: 16),
                                    shape: const RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                    )),
                              ),
                            ],
                          ),
                        ),
                        PromoAccordionParent(
                          callback: (promo) {
                            setState(() {
                              _promo = promo;
                            });
                            print(_promo != null ? _promo!.name : promo);
                          },
                          promos:
                              Provider.of<PromoProvider>(context, listen: false)
                                  .promos,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )),
            Container(
              margin: EdgeInsets.only(left: 24, right: 24, bottom: 32, top: 24),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Provider.of<PromoProvider>(context, listen: false)
                      .changePromo(_promo);

                  Navigator.of(context).pushNamedAndRemoveUntil(
                      "/cart", ModalRoute.withName("/home"));
                },
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    "Update promo code",
                    style: button.copyWith(color: neutralWhite),
                  ),
                  const SizedBox(width: 10),
                  Icon(TablerIcons.chevron_right,
                      size: 16, color: neutralWhite),
                ]),
                style: ElevatedButton.styleFrom(
                    primary: primary50,
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
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

typedef void PromoCallback(Promo? promo);

class PromoAccordionParent extends StatefulWidget {
  const PromoAccordionParent({
    Key? key,
    required this.promos,
    required this.callback,
  }) : super(key: key);

  final List<Promo> promos;
  final PromoCallback callback;

  @override
  State<PromoAccordionParent> createState() => _PromoAccordionParentState();
}

class _PromoAccordionParentState extends State<PromoAccordionParent> {
  List<int> _activeAccordion = [];
  int selectedPromo = -1;
  Promo? promo;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: widget.promos.length > 0
              ? widget.promos
                  .asMap()
                  .entries
                  .map((entry) => GestureDetector(
                        onTap: () {
                          if (_activeAccordion.contains(entry.key)) {
                            setState(() {
                              _activeAccordion.remove(entry.key);
                            });
                          } else {
                            setState(() {
                              _activeAccordion.add(entry.key);
                            });
                          }
                          if (selectedPromo == entry.key) {
                            setState(() {
                              selectedPromo = -1;
                              promo = null;
                            });
                          } else {
                            setState(() {
                              selectedPromo = entry.key;
                              promo = entry.value;
                            });
                          }
                          widget.callback(promo);
                          print(promo != null ? promo!.name : promo);
                        },
                        child: PromoAccordionChild(
                          promo: entry.value,
                          isActive: _activeAccordion.contains(0),
                          isSelected: selectedPromo == entry.key,
                        ),
                      ))
                  .toList()
              : [SizedBox()],
        ));
  }
}

class PromoAccordionChild extends StatelessWidget {
  const PromoAccordionChild({
    Key? key,
    required this.promo,
    required this.isActive,
    required this.isSelected,
  }) : super(key: key);

  final Promo promo;
  final bool isActive;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: isSelected ? green1 : Colors.transparent,
          border:
              Border.all(color: isSelected ? green2 : neutralGrey, width: 2)),
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 24, vertical: 18),
      margin: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${promo.name} ${promo.percent}%",
                      style: subtitle2.copyWith(
                        color: neutralBlack,
                      )),
                  SizedBox(height: 5),
                  Text("See detail",
                      style: caption.copyWith(
                        color: accent50,
                      )),
                ],
              ),
              Icon(TablerIcons.chevron_down,
                  color: isActive ? neutralBlack : neutralGrey2, size: 24)
            ],
          ),
          isActive ? SizedBox(height: 18) : SizedBox(),
          isActive
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(promo.detail,
                        style: caption.copyWith(
                            color: isSelected ? green2 : neutralGrey2)),
                    SizedBox(height: 16),
                    Row(
                      children: [
                        Icon(TablerIcons.clock,
                            size: 14,
                            color: isSelected ? green2 : neutralGrey2),
                        SizedBox(width: 12),
                        Text(promo.ends,
                            style: caption.copyWith(
                                color: isSelected ? green2 : neutralGrey2)),
                      ],
                    ),
                  ],
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
