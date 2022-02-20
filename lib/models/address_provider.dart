import 'package:flutter/foundation.dart';

class AddressProvider with ChangeNotifier {
  Address? _address;

  Address? get address => _address;

  changeAddress(Address address) {
    _address = address;
  }
}

class Address {
  String name;
  String address;
  String addressDetail;
  String phone;

  Address({
    Key? key,
    required this.name,
    required this.address,
    required this.addressDetail,
    required this.phone,
  });
}
