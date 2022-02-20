import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

class NewPasswordPage extends StatefulWidget {
  const NewPasswordPage({Key? key}) : super(key: key);

  @override
  State<NewPasswordPage> createState() => _NewPasswordPageState();
}

class _NewPasswordPageState extends State<NewPasswordPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  bool isButtonEnabled = false;
  bool showPassword1 = false;
  bool showPassword2 = false;
  int level = 0;

  void changeButtonState() {
    if (_passwordController.text.length >= 6) {
      setState(() {
        if (_passwordController.text.contains(RegExp(r'[0-9]'))) {
          level = 2;
        } else {
          level = 1;
        }

        if (_passwordController.text == _passwordConfirmController.text) {
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
                          "Let set up your password",
                          style: headline5,
                        ),
                        const SizedBox(height: 18),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 263),
                          child: Text(
                            "Your password must be different from previews password",
                            style: subtitle2,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        TextField(
                          obscureText: !showPassword1,
                          onChanged: (text) {
                            changeButtonState();
                          },
                          controller: _passwordController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textField,
                            hintText: 'Create new password',
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
                                  if (showPassword1) {
                                    showPassword1 = false;
                                  } else {
                                    showPassword1 = true;
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
                        const SizedBox(height: 16),
                        TextField(
                          obscureText: !showPassword2,
                          onChanged: (text) {
                            changeButtonState();
                          },
                          controller: _passwordConfirmController,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: textField,
                            hintText: 'Confirm password',
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
                                  if (showPassword2) {
                                    showPassword2 = false;
                                  } else {
                                    showPassword2 = true;
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
                        _passwordConfirmController.text != ""
                            ? const SizedBox(height: 12)
                            : SizedBox(),
                        _passwordConfirmController.text != ""
                            ? Text(
                                _passwordController.text ==
                                        _passwordConfirmController.text
                                    ? ""
                                    : "Both passwords must match",
                                style: caption.copyWith(color: neutralGrey2))
                            : SizedBox(),
                        const SizedBox(height: 24),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              isButtonEnabled
                                  ? Navigator.of(context)
                                      .pushNamedAndRemoveUntil(
                                          "/home", (route) => false)
                                  : () {};
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Reset Password",
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
