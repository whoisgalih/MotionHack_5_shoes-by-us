import 'package:flutter/foundation.dart';
import 'package:uuid/uuid.dart';

class PaymentProvider with ChangeNotifier {
  Payment _payment = Payment(
      name: "BCA Virtual Account",
      image: "assets/icons/logo bank bca-01 1.png");

  Payment get payment => _payment;

  changePayment(Payment payment) {
    _payment = payment;
  }
}

class Payment {
  final String name;
  final String image;
  String number;
  String cvv;
  String expireDate;

  Payment({
    Key? key,
    required this.name,
    required this.image,
    this.number = "",
    this.cvv = "",
    this.expireDate = "",
  });
}
