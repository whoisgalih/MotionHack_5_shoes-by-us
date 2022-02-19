import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_by_us/pages/auth/sign_up_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class BoardingPage extends StatelessWidget {
  const BoardingPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: neutralWhite,
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 100.54, bottom: 48),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  child: Column(
                    children: [
                      SvgPicture.asset('assets/icons/sUs.svg',
                          height: 33.09, width: 83.04, color: neutralBlack),
                      const SizedBox(
                        height: 66.37,
                      ),
                      Text('House of Finemade Shoes',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w700,
                            fontSize: 28,
                            color: neutralBlack,
                          )),
                      const SizedBox(
                        height: 13,
                      ),
                      Text(
                          'The finest, modest, and toughest boots for your feet.',
                          textAlign: TextAlign.center,
                          style: subtitle1)
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 42),
                  child: Column(children: [
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SignUpPage()));
                        },
                        child: Text(
                          "Sign up with Email ID",
                          style: button.copyWith(color: neutralWhite),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: neutralBlack,
                            elevation: 0,
                            padding: const EdgeInsets.all(18),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () => Navigator.of(context)
                            .pushNamedAndRemoveUntil("/home", (route) => false),
                        child: Text(
                          "Continue with Google",
                          style: button.copyWith(color: neutralBlack),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: neutralWhite,
                            elevation: 0,
                            padding: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                side: BorderSide(
                                  color: border,
                                  width: 2,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    Wrap(
                      direction: Axis.horizontal,
                      // mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: button,
                        ),
                        GestureDetector(
                          onTap: () =>
                              Navigator.of(context).pushNamed('/sign-in'),
                          child: Text(
                            "Sign In",
                            style: button.copyWith(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    )
                  ]),
                )
              ],
            ),
          ),
        ));
  }
}
