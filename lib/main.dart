import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shoes_by_us/models/payment_provider.dart';
import 'package:shoes_by_us/models/promo_provider.dart';
import 'package:shoes_by_us/models/shoes_provider.dart';
import 'package:shoes_by_us/pages/auth/boarding_page.dart';
import 'package:shoes_by_us/pages/auth/check_email_page.dart';
import 'package:shoes_by_us/pages/auth/new_password_page.dart';
import 'package:shoes_by_us/pages/auth/reset_password_page.dart';
import 'package:shoes_by_us/pages/cart/address_page.dart';
import 'package:shoes_by_us/pages/cart/card_page.dart';
import 'package:shoes_by_us/pages/cart/cart_page.dart';
import 'package:shoes_by_us/pages/cart/payment_success_page.dart';
import 'package:shoes_by_us/pages/cart/promo_page.dart';
import 'package:shoes_by_us/pages/cart/track_item_page.dart';
import 'package:shoes_by_us/pages/home/home_page.dart';
import 'package:shoes_by_us/pages/auth/sign_up_page.dart';
import 'package:shoes_by_us/pages/auth/sign_in_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/pages/cart/payment_mathod_page.dart';

void main() {
  runApp(const ShoesByUs());
}

class ShoesByUs extends StatelessWidget {
  const ShoesByUs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PromoProvider>(
      create: (context) => PromoProvider(),
      child: ChangeNotifierProvider<PaymentProvider>(
        create: (context) => PaymentProvider(),
        child: ChangeNotifierProvider<ShoesProvider>(
          create: (context) => ShoesProvider(),
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              scaffoldBackgroundColor: neutralWhite,
              textTheme: TextTheme(
                headline4: GoogleFonts.poppins(
                    fontSize: 34,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0125),
                headline5: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0125),
                headline6: GoogleFonts.poppins(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0125),
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
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.0125),
                bodyText2: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.0125),
                button: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 0.0125),
                caption: GoogleFonts.inter(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.004),
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
              "/cart": (context) => const CartPage(),
              "/payment-method": (context) => const PaymentMethodPage(),
              "/payment-success": (context) => const PaymentSuccessPage(),
              "/track": (context) => const TrackItemPage(),
              "/card": (context) => const CardPage(),
              "/promo": (context) => const PromoPage(),
              "/address": (context) => const AddressPage(),
              "/new-password": (context) => const NewPasswordPage(),
            },
          ),
        ),
      ),
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
