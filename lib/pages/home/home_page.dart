import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/pages/home/pupular_today_sub_page.dart';
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
                        GestureDetector(
                          onTap: () => Navigator.of(context).pushNamed("/"),
                          child: Icon(
                            TablerIcons.menu,
                            size: 24,
                            color: neutralBlack,
                          ),
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
                ],
              ),
            ),
            Container(
              clipBehavior: Clip.none,
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Column(
                children: [
                  SingleChildScrollView(
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
                ],
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Expanded(
                child: SingleChildScrollView(child: PopularTodaySubPage())),
          ],
        )));
  }
}
