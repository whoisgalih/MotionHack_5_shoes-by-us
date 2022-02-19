import 'package:flutter/foundation.dart';

class PromoProvider with ChangeNotifier {
  Promo? _selectedPromo;
  final List<Promo> _promos = [
    Promo(
        name: "Cashback",
        percent: 20,
        detail:
            "• Minimal purchase of Rp80.000\n• JABODETABEK regions only\n• Cannot be used with OVO payment",
        ends: "Ends in 1 week"),
    Promo(
        name: "Cashback",
        percent: 20,
        detail:
            "• Minimal purchase of Rp80.000\n• JABODETABEK regions only\n• Cannot be used with OVO payment",
        ends: "Ends in 1 week")
  ];

  List<Promo> get promos => _promos;
  Promo? get selectedPromo => _selectedPromo;

  changePromo(Promo? promo) {
    _selectedPromo = promo;
  }

  num calculateDiscount(num discount, num price) {
    return price * discount / 100;
  }

  num calculatePriceAfterDiscount(num discount, num price) {
    return price * (1 - discount / 100);
  }
}

class Promo {
  final String name;
  final int percent;
  final String detail;
  final String ends;

  Promo({
    Key? key,
    required this.name,
    required this.percent,
    required this.detail,
    required this.ends,
  });
}
