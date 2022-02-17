import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;

  void changeButtonState() {
    if (_nameController.text.isNotEmpty &&
        _emailController.text.isNotEmpty &&
        _passwordController.text.length >= 6) {
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
                children: [
                  Row(
                    children: [
                      const Icon(Icons.chevron_left_rounded),
                      const SizedBox(width: 24),
                      Text('Back', style: headline6)
                    ],
                  ),
                  const Icon(Icons.question_mark_rounded)
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                // height: double.infinity,
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign Up",
                          style: headline5,
                        ),
                        const SizedBox(height: 18),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 263),
                          child: Text(
                            "Create an account so you can order your favorite products even faster 🔥",
                            style: subtitle2,
                          ),
                        ),
                        const SizedBox(
                          height: 36,
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
                              child: Icon(
                                TablerIcons.user,
                                size: 24,
                                color: neutralBlack,
                              ),
                            ),
                            prefixIconColor: textFieldHint,
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (text) {
                            changeButtonState();
                          },
                          controller: _emailController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textField,
                            hintText: 'johndoe@company.com',
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
                              child: Icon(
                                TablerIcons.at,
                                size: 24,
                                color: neutralBlack,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        TextField(
                          onChanged: (text) {
                            changeButtonState();
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textField,
                            hintText: 'johndoepassword',
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
                            contentPadding:
                                const EdgeInsets.symmetric(vertical: 17),
                            prefixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 32, right: 24),
                              child: Icon(
                                TablerIcons.lock,
                                size: 24,
                                color: neutralBlack,
                              ),
                            ),
                            suffixIcon: Padding(
                              padding:
                                  const EdgeInsets.only(left: 24, right: 32),
                              child: Icon(
                                TablerIcons.eye,
                                size: 24,
                                color: neutralBlack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                    Column(
                      children: [
                        RichText(
                            text: TextSpan(
                                style: caption.copyWith(color: neutralBlack),
                                text: "By signing up, you're agree to our ",
                                children: [
                              TextSpan(
                                  text: "T.O.S",
                                  style: caption.copyWith(
                                      fontWeight: FontWeight.w700)),
                              TextSpan(
                                text: " and ",
                                style: caption,
                              ),
                              TextSpan(
                                  text: "Privacy Policy",
                                  style: caption.copyWith(
                                      fontWeight: FontWeight.w700)),
                            ])),
                        const SizedBox(height: 31),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              isButtonEnabled
                                  ? Navigator.of(context).pushNamed('/home')
                                  : () {};
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Create Account",
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
