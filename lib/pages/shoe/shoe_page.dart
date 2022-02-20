import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/formater/addDot.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/models/shoes_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/shoe/accordion.dart';
import 'package:shoes_by_us/widgets/shoe/shoe_page_app_bar.dart';

class ShoePage extends StatefulWidget {
  final Shoes? shoe;

  const ShoePage({Key? key, required this.shoe}) : super(key: key);

  @override
  State<ShoePage> createState() => _ShoePageState();
}

class _ShoePageState extends State<ShoePage> {
  int selectedSize = 0;

  bool isButtonEnabled = false;
  bool isInCart = false;

  void changeButtonState() {
    if (!isInCart && selectedSize != 0) {
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
      body: SafeArea(
        child: widget.shoe != null
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ShoePageAppBar(),
                  Expanded(
                      child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Image(
                          image: AssetImage(widget.shoe!.image),
                          height: 252,
                          width: double.infinity,
                          fit: BoxFit.fitHeight,
                        ),
                        Container(
                          padding: EdgeInsets.all(24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.shoe!.name,
                                textAlign: TextAlign.center,
                                style: bodyText1.copyWith(color: neutralGrey2),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                widget.shoe!.name,
                                style: headline6.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: neutralBlack),
                              ),
                              SizedBox(
                                height: 14,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "${addDot(widget.shoe!.discountPercent == 0 ? widget.shoe!.price : (widget.shoe!.price * (1 - widget.shoe!.discountPercent / 100)))}",
                                    style: bodyText1,
                                  ),
                                  SizedBox(width: 18),
                                  Text(
                                    "${addDot(widget.shoe!.price)}",
                                    style: bodyText1.copyWith(
                                        color: neutralGrey2,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Size-Mens (us)",
                                      style: headline6.copyWith(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 14)),
                                  Text("View Chart",
                                      style: caption.copyWith(
                                          decoration: TextDecoration.underline,
                                          color: neutralGrey2))
                                ],
                              ),
                              SizedBox(
                                height: 18,
                              ),
                              SingleChildScrollView(
                                clipBehavior: Clip.none,
                                scrollDirection: Axis.horizontal,
                                child: Wrap(
                                  spacing: 10,
                                  direction: Axis.horizontal,
                                  children: widget.shoe!.sizes
                                      .map((e) => GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              selectedSize = e;
                                            });
                                            isInCart =
                                                Provider.of<ShoesProvider>(
                                                            context,
                                                            listen: false)
                                                        .findIndexByNameAndSize(
                                                            widget.shoe!.name,
                                                            selectedSize) !=
                                                    null;
                                            changeButtonState();
                                          },
                                          child: ShoeSize(
                                              isActive: selectedSize == e,
                                              size: e)))
                                      .toList(),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    if (isButtonEnabled) {
                                      if (Provider.of<ShoesProvider>(context,
                                                  listen: false)
                                              .findIndexByNameAndSize(
                                                  widget.shoe!.name,
                                                  selectedSize) !=
                                          null) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                          content: Text('Item already in cart',
                                              style: subtitle1.copyWith(
                                                  color: red2)),
                                          backgroundColor: red1,
                                          duration: const Duration(
                                              milliseconds: 3000),
                                          padding: const EdgeInsets.all(16),
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 24),
                                          behavior: SnackBarBehavior.floating,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ));
                                      } else {
                                        setState(() {
                                          isInCart = true;
                                        });
                                        widget.shoe!.selectedSize =
                                            selectedSize;
                                        widget.shoe!.quantity = 1;
                                        Provider.of<ShoesProvider>(context,
                                                listen: false)
                                            .addShoes(widget.shoe!);
                                      }
                                      changeButtonState();

                                      // Navigator.of(context).pushNamed("/cart");
                                    }
                                  },
                                  child: Text(
                                    isInCart
                                        ? 'Item already in cart'
                                        : "Add to cart",
                                    style: button.copyWith(
                                        color: isButtonEnabled
                                            ? neutralWhite
                                            : neutralGrey2),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      primary: isButtonEnabled
                                          ? neutralBlack
                                          : neutralGrey,
                                      elevation: 0,
                                      padding: const EdgeInsets.all(18),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(8)),
                                      )),
                                ),
                              ),
                              SizedBox(
                                height: 32,
                              ),
                              AccordionParent(shoe: widget.shoe),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            : SizedBox(),
      ),
    );
  }
}

class ShoeSize extends StatelessWidget {
  final bool isActive;
  final int size;

  const ShoeSize({
    Key? key,
    required this.isActive,
    required this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: isActive ? neutralBlack : neutralWhite,
            borderRadius: BorderRadius.all(Radius.circular(8)),
            border: Border.all(
              width: 2,
              color: isActive ? neutralBlack : neutralGrey,
            )),
        child: Text("$size",
            style: subtitle2.copyWith(
                color: isActive ? neutralWhite : neutralBlack)));
  }
}
