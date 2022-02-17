import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: neutralWhite,
        body: SafeArea(
            child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 24, vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          TablerIcons.menu,
                          size: 24,
                          color: neutralBlack,
                        ),
                        Text(
                          "Shoes By Us",
                          style: appBarBrandTitle,
                        ),
                        Icon(
                          TablerIcons.search,
                          size: 24,
                          color: neutralBlack,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Container(
                    clipBehavior: Clip.none,
                    margin: EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      clipBehavior: Clip.none,
                      scrollDirection: Axis.horizontal,
                      child: Wrap(
                        clipBehavior: Clip.none,
                        direction: Axis.horizontal,
                        spacing: 21,
                        children: [
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                          Text(
                            "Popular Today",
                            style: subtitle2,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(24),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: neutralGrey,
                            width: 2,
                          )),
                      child: Column(
                        children: [
                          // Image(image: AssetImage("")),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
          ],
        )));
  }
}
