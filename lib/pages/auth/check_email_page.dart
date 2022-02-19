import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_by_us/widgets/auth/auth_app_bar.dart';

class CheckEmailPage extends StatefulWidget {
  const CheckEmailPage({Key? key}) : super(key: key);

  @override
  State<CheckEmailPage> createState() => _CheckEmailPageState();
}

class _CheckEmailPageState extends State<CheckEmailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: neutralWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AuthAppBar(),
            Expanded(
                child: Container(
              width: double.infinity,
              // height: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    "assets/icons/mail-check.svg",
                    height: 124,
                    width: 124,
                  ),
                  SizedBox(height: 61),
                  Text("Check your mail", style: headline5),
                  SizedBox(height: 18),
                  Text(
                    "We have sent a password recover to your email",
                    style: subtitle2,
                  ),
                  SizedBox(height: 46),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed('/new-password');
                    },
                    child: Text(
                      "Open Email",
                      style: button.copyWith(color: neutralWhite),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: primary50,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(
                            vertical: 16, horizontal: 24),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                        )),
                  ),
                  SizedBox(
                    height: 26,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .pushNamedAndRemoveUntil("/home", (route) => false);
                    },
                    child: Text(
                      "Skip, I'll confirm later",
                      style: subtitle2,
                    ),
                  )
                ],
              ),
            )),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text:
                          "Did not receive any email from us?  Check your spam filter or try ",
                      style: caption.copyWith(color: neutralGrey2),
                      children: [
                        TextSpan(
                          text: "another email address",
                          style: caption.copyWith(color: accent50),
                        )
                      ])),
            ),
            SizedBox(height: 61),
          ],
        ),
      ),
    );
  }
}
