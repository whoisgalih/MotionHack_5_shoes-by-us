import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/models/address_provider.dart';
import 'package:shoes_by_us/models/promo_provider.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({
    Key? key,
  }) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _addressDetailController =
      TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  // Address? _address;

  int selectedSize = 0;

  bool isButtonEnabled = false;

  void changeButtonState() {
    if (_phoneController.text.length >= 3 &&
        _nameController.text.isNotEmpty &&
        _addressDetailController.text.isNotEmpty &&
        _addressController.text.isNotEmpty) {
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
                  Text('Address Details', style: headline6)
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Name of recipient",
                                  style:
                                      subtitle2.copyWith(color: neutralBlack)),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                onChanged: (text) {
                                  changeButtonState();
                                },
                                controller: _nameController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textField,
                                  hintText: 'John Doe',
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
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Recipiant's Address",
                                  style:
                                      subtitle2.copyWith(color: neutralBlack)),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                onChanged: (text) {
                                  changeButtonState();
                                },
                                controller: _addressController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textField,
                                  hintText: 'Input Here',
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
                                      left: 24, top: 16, bottom: 16),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 32),
                                    child: Icon(
                                      TablerIcons.location,
                                      size: 24,
                                      color: neutralBlack,
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                    Container(
                      margin: EdgeInsets.only(bottom: 24),
                      child: Image(
                          image: AssetImage("assets/images/Rectangle 113.png"),
                          height: 141,
                          width: double.infinity),
                    ),
                    Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Address Detail",
                                  style:
                                      subtitle2.copyWith(color: neutralBlack)),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                onChanged: (text) {
                                  changeButtonState();
                                },
                                controller: _addressDetailController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textField,
                                  hintText: 'House number, Block',
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
                            ])),
                    Container(
                        margin: EdgeInsets.only(bottom: 24),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone number",
                                  style:
                                      subtitle2.copyWith(color: neutralBlack)),
                              SizedBox(
                                height: 12,
                              ),
                              TextField(
                                keyboardType: TextInputType.phone,
                                onChanged: (text) {
                                  changeButtonState();
                                },
                                controller: _phoneController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: textField,
                                  hintText: 'Input here',
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
                                  contentPadding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                  prefixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16,
                                        bottom: 16,
                                        left: 32,
                                        right: 24),
                                    child: Text("+62",
                                        style: button.copyWith(
                                          color: neutralBlack,
                                        )),
                                  ),
                                  suffixIcon: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 24, right: 32),
                                    child: Icon(
                                      TablerIcons.book,
                                      size: 24,
                                      color: neutralBlack,
                                    ),
                                  ),
                                ),
                              ),
                            ])),
                    Container(
                      margin: EdgeInsets.only(top: 12),
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (isButtonEnabled) {
                            Provider.of<AddressProvider>(context, listen: false)
                                .changeAddress(Address(
                                    name: _nameController.text,
                                    address: _addressController.text,
                                    addressDetail:
                                        _addressDetailController.text,
                                    phone: _phoneController.text));
                            Navigator.of(context).pushNamedAndRemoveUntil(
                                "/cart", ModalRoute.withName("/home"));
                          }
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Add Address",
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
                            primary: isButtonEnabled ? primary50 : neutralGrey,
                            elevation: 0,
                            padding: const EdgeInsets.all(18),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
