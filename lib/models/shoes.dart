import 'dart:ffi';

import 'package:flutter/foundation.dart';

class Shoes {
  final String id;
  final String image;
  final String name;
  final String brand;
  final String desc;
  final int price;
  final List<int> sizes;
  final double discountPercent;
  int? selectedSize;
  int? quantity;

  Shoes({
    Key? key,
    required this.id,
    required this.image,
    required this.name,
    required this.brand,
    required this.desc,
    required this.price,
    required this.sizes,
    required this.discountPercent,
    this.selectedSize = 0,
    this.quantity = 0,
  });
}
