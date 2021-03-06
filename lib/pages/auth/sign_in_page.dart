import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isButtonEnabled = false;
  bool showPassword = false;

  void changeButtonState() {
    if (_emailController.text.contains("@") &&
        _emailController.text.contains(".") &&
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
                          "Welcome Back!",
                          style: headline5,
                        ),
                        const SizedBox(height: 18),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 263),
                          child: Text(
                            "It seems like you already have an account, lets sign in shall we ????",
                            style: subtitle2,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
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
                        SizedBox(height: 24),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context)
                                    .pushNamed("/reset-password");
                              },
                              child: Text("Reset Password",
                                  style: button.copyWith(color: neutralGrey2)),
                            ),
                          ],
                        ),
                        const SizedBox(height: 32),
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
                                  "Login",
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
                        SizedBox(
                          height: 24,
                        ),
                        Wrap(
                          direction: Axis.horizontal,
                          children: [
                            Text(
                              "Not having an account yet?  ",
                              style: button,
                            ),
                            GestureDetector(
                              onTap: () =>
                                  Navigator.of(context).pushNamed('/sign-up'),
                              child: Text(
                                "Sign Up",
                                style: button.copyWith(
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ],
                        )
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
