import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  bool isButtonEnabled = false;

  void changeButtonState() {
    if (_emailController.text.isNotEmpty) {
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
                            "It seems like you already have an account, lets sign in shall we 😀",
                            style: subtitle2,
                          ),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
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
                        Row(
                          children: [
                            Icon(TablerIcons.info_circle),
                            SizedBox(
                              width: 12,
                            ),
                            Text("Reset Password",
                                style: button.copyWith(color: neutralGrey2)),
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
                                  // ? Navigator.of(context).pushNamed('/home')
                                  ? Navigator.of(context)
                                      .pushNamed('/check-email')
                                  : () {};
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Send Instructions",
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
