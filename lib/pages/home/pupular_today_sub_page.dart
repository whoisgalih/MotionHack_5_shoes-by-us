import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/widgets/featured_shoe.dart';
import 'package:shoes_by_us/widgets/shoe_list.dart';

class PopularTodaySubPage extends StatefulWidget {
  const PopularTodaySubPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PopularTodaySubPage> createState() => _PopularTodaySubPageState();
}

class _PopularTodaySubPageState extends State<PopularTodaySubPage> {
  Shoes? _featuredShoe;
  List<Shoes> _shoes = [];

  Future<void> readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/shoes.json');
    final Map data = await json.decode(response);
    final List<Map> shoes = [...data['shoes']];
    final List<Shoes> __shoes = shoes
        .map((shoe) => Shoes(
              id: shoe["id"].toString(),
              image: shoe["image"],
              name: shoe["name"],
              brand: shoe["brand"],
              desc: shoe["desc"],
              price: shoe["price"],
              sizes: (shoe["sizes"] as List).map((i) => i as int).toList(),
              discountPercent: shoe["discountPercent"].toDouble(),
            ))
        .toList();
    setState(() {
      _featuredShoe = __shoes.removeAt(0);
      _shoes = __shoes;
    });
  }

  @override
  Widget build(BuildContext context) {
    readJson();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      clipBehavior: Clip.none,
      child: Column(
        children: [
          (_featuredShoe != null)
              ? FeaturedShoe(featuredShoe: _featuredShoe)
              : SizedBox(),
          SizedBox(
            height: 16,
          ),
          ShoesList(shoes: _shoes),
          SizedBox(
            height: 24,
          ),
        ],
      ),
    );
  }
}
