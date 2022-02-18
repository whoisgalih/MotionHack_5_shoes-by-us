import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shoes_by_us/models/shoes.dart';
import 'package:shoes_by_us/widgets/home/shoe_item.dart';

class ShoesList extends StatelessWidget {
  final List<Shoes> shoes;

  const ShoesList({
    Key? key,
    required this.shoes,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 16,
      crossAxisSpacing: 19,
      physics:
          NeverScrollableScrollPhysics(), // to disable GridView's scrolling
      shrinkWrap: true, // You won't see infinite size error
      itemBuilder: (context, index) {
        final shoe = shoes[index];
        return ShoeItem(shoe: shoe);
      },
      itemCount: shoes.length,
    );
  }
}
