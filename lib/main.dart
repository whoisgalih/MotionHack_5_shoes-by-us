import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shoes_by_us/pages/auth/boarding_page.dart';
import 'package:shoes_by_us/pages/auth/check_email_page.dart';
import 'package:shoes_by_us/pages/auth/reset_password_page.dart';
import 'package:shoes_by_us/pages/home/home_page.dart';
import 'package:shoes_by_us/pages/auth/sign_up_page.dart';
import 'package:shoes_by_us/pages/auth/sign_in_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/widgets/cart/payment_mathod_page.dart';

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
        scaffoldBackgroundColor: neutralWhite,
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
            color: neutralGrey2,
          ),
          subtitle2: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.0125,
            color: neutralGrey2,
          ),
          bodyText1: GoogleFonts.inter(
              fontSize: 16, fontWeight: FontWeight.w400, letterSpacing: 0.0125),
          bodyText2: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.0125),
          button: GoogleFonts.inter(
              fontSize: 14, fontWeight: FontWeight.w500, letterSpacing: 0.0125),
          caption: GoogleFonts.inter(
              fontSize: 12, fontWeight: FontWeight.w400, letterSpacing: 0.004),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Wrapper(),
        '/sign-up': (context) => const SignUpPage(),
        '/home': (context) => const HomePage(),
        '/sign-in': (context) => const SignInPage(),
        '/reset-password': (context) => const ResetPasswordPage(),
        '/check-email': (context) => const CheckEmailPage(),
        "/payment-method": (context) => const PaymentMethodPage(),
      },
    );
  }
}

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const BoardingPage();
  }
}
