import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

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
  bool showPassword = false;
  int level = 0;

  void changeButtonState() {
    if (_passwordController.text.length >= 6) {
      setState(() {
        if (_passwordController.text.contains(RegExp(r'[0-9]')) &&
            _passwordController.text.contains(RegExp(r'[a-zA-Z]'))) {
          level = 2;
        } else {
          level = 1;
        }

        if (_nameController.text.isNotEmpty &&
            _emailController.text.contains("@") &&
            _emailController.text.contains(".") &&
            _passwordController.text.length >= 6) {
          isButtonEnabled = true;
        } else {
          isButtonEnabled = false;
        }
      });
    } else {
      setState(() {
        isButtonEnabled = false;
      });
      level = 0;
    }
  }

  // void changeButtonState() {
  //   if (_nameController.text.isNotEmpty &&
  //       _emailController.text.contains("@") &&
  //       _emailController.text.contains(".") &&
  //       _passwordController.text.length >= 6) {
  //     setState(() {
  //       isButtonEnabled = true;
  //     });
  //   } else {
  //     setState(() {
  //       isButtonEnabled = false;
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
        child: Column(
          children: [
            AuthAppBar(),
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
                          keyboardType: TextInputType.name,
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
                          keyboardType: TextInputType.emailAddress,
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
                          obscureText: !showPassword,
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
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() {
                                  if (showPassword) {
                                    showPassword = false;
                                  } else {
                                    showPassword = true;
                                  }
                                });
                              },
                              child: Padding(
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
                        ),
                        _passwordController.text != ""
                            ? const SizedBox(height: 12)
                            : SizedBox(),
                        _passwordController.text != ""
                            ? Row(
                                children: [
                                  Container(
                                      width: 62,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: red1,
                                      )),
                                  SizedBox(width: 4),
                                  Container(
                                      width: 62,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color:
                                            level > 0 ? yellow1 : neutralGrey,
                                      )),
                                  SizedBox(width: 4),
                                  Container(
                                      width: 62,
                                      height: 4,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(2),
                                        color: level > 1 ? green1 : neutralGrey,
                                      )),
                                  SizedBox(width: 12),
                                  Text(
                                      level > 1
                                          ? "Good to go"
                                          : level > 0
                                              ? "Could be strongger"
                                              : "Weak password",
                                      style: caption.copyWith(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 10,
                                        color: level > 1
                                            ? green2
                                            : level > 0
                                                ? yellow2
                                                : red2,
                                      ))
                                ],
                              )
                            : SizedBox(),
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
                                  ? Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          "/sign-up-success", (route) => false)
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
