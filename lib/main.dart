import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

void main() {
  runApp(const ShoesByUs());
}

class ShoesByUs extends StatelessWidget {
  const ShoesByUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headline4: GoogleFonts.poppins(
              fontSize: 34, fontWeight: FontWeight.w500, letterSpacing: 0.0125),
          headline5: GoogleFonts.poppins(
              fontSize: 24, fontWeight: FontWeight.w500, letterSpacing: 0.0125),
          headline6: GoogleFonts.poppins(
              fontSize: 20, fontWeight: FontWeight.w500, letterSpacing: 0.0125),
          subtitle1: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.0125,
              color: const Color(0xFF959595)),
          subtitle2: GoogleFonts.poppins(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.0125,
              color: const Color(0xFF959595)),
          bodyText1: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.0125),
          bodyText2: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.0125),
          button: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.0125),
          caption: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.004),
        ),
        primaryColor: accent50,
      ),
      home: const Wrapper(),
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

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
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: neutralWhite),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: neutralBlack,
                            elevation: 0,
                            padding: const EdgeInsets.all(18),
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(8)),
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "Sign up with Email ID",
                          style: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: neutralBlack),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: neutralWhite,
                            elevation: 0,
                            padding: const EdgeInsets.all(18),
                            shape: RoundedRectangleBorder(
                                borderRadius: const BorderRadius.all(
                                    const Radius.circular(8)),
                                side: BorderSide(
                                  color: border,
                                  width: 2,
                                ))),
                      ),
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?  ",
                          style: button,
                        ),
                        Text(
                          "Sign In",
                          style: button.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w700,
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

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();

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
                margin:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                child: Column(
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
                      controller: _nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: textField,
                        hintText: 'Name',
                        hintStyle: Theme.of(context)
                            .textTheme
                            .button
                            ?.copyWith(color: textFieldHint),
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
                            left: 80, right: 32, top: 17, bottom: 17),
                        prefixIcon: const Padding(
                          padding: EdgeInsets.only(left: 32, right: 24),
                          child: Icon(TablerIcons.user, size: 24),
                        ),
                        prefixIconColor: textFieldHint,
                        // prefixIconConstraints: const BoxConstraints(
                        //     maxHeight: 24, maxWidth: 24)
                      ),
                    ),
                    TextField(
                      obscureText: true,
                      controller: _nameController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: textField,
                          hintText: 'Name',
                          hintStyle: Theme.of(context)
                              .textTheme
                              .button
                              ?.copyWith(color: textFieldHint),
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
                              horizontal: 32, vertical: 17),
                          focusColor: accent50,
                          prefixIcon: const Icon(TablerIcons.user),
                          prefixIconColor: neutralBlack,
                          prefixIconConstraints: const BoxConstraints(
                              maxHeight: 24, maxWidth: 24)),
                    ),
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

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: const Text("Hello"));
  }
}
