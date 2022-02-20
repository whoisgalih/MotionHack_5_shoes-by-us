import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class SuccesSignUpPage extends StatelessWidget {
  const SuccesSignUpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: neutralGrey,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 42),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/icons/Cool Guy.svg",
                        height: 320,
                        width: 320,
                      ),
                      SizedBox(height: 42),
                      Text(
                        "Congratulations!",
                        style: headline6.copyWith(
                            fontWeight: FontWeight.w700, fontSize: 24),
                      ),
                      SizedBox(height: 24),
                      Text(
                        "Your account has ben set up, if you have a minute, please check your related email to comnfirm validity of your account 😀",
                        textAlign: TextAlign.center,
                        style: subtitle2,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 32, left: 42, right: 42),
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context)
                        .pushNamedAndRemoveUntil("/home", (route) => false);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Continue",
                        style: button.copyWith(color: neutralWhite),
                      ),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: neutralBlack,
                      elevation: 0,
                      padding: const EdgeInsets.all(18),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      )),
                ),
              ),
            ],
          ),
        ));
  }
}
