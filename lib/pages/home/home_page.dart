import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:shoes_by_us/pages/home/pupular_today_sub_page.dart';
import 'package:shoes_by_us/themes/colors.dart';
import 'package:shoes_by_us/themes/fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Container(
          width: 280,
          child: Drawer(
            backgroundColor: neutralWhite,
            child: SafeArea(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 115, vertical: 52),
                      child: SvgPicture.asset('assets/icons/sUs.svg',
                          height: 20, width: 51, color: neutralBlack),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text("MEN'S SHOES",
                              style: caption.copyWith(color: neutralGrey2)),
                          margin: EdgeInsets.only(left: 24),
                        ),
                        SizedBox(height: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/shoe 4.svg',
                                      height: 20, width: 51, color: accent50),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text("Sneakers",
                                      style:
                                          subtitle2.copyWith(color: accent50)),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 21),
                              margin: EdgeInsets.only(bottom: 14),
                              decoration: BoxDecoration(
                                  border: Border(
                                      left: BorderSide(
                                          color: accent50, width: 3))),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/shoe 4.svg',
                                      height: 20,
                                      width: 51,
                                      color: neutralGrey2),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text("Golf Shoes",
                                      style: subtitle2.copyWith(
                                          color: neutralGrey2)),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 24),
                              margin: EdgeInsets.only(bottom: 14),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/shoe 4.svg',
                                      height: 20,
                                      width: 51,
                                      color: neutralGrey2),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text("Chuck Taylor",
                                      style: subtitle2.copyWith(
                                          color: neutralGrey2)),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 24),
                              margin: EdgeInsets.only(bottom: 14),
                            ),
                            Container(
                              child: Row(
                                children: [
                                  SvgPicture.asset('assets/icons/shoe 4.svg',
                                      height: 20,
                                      width: 51,
                                      color: neutralGrey2),
                                  SizedBox(
                                    width: 18,
                                  ),
                                  Text("Hiking Boots",
                                      style: subtitle2.copyWith(
                                          color: neutralGrey2)),
                                ],
                              ),
                              padding: EdgeInsets.only(left: 24),
                              margin: EdgeInsets.only(bottom: 14),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("WOMEN'S SHOES",
                                    style:
                                        caption.copyWith(color: neutralGrey2)),
                                margin: EdgeInsets.only(left: 24),
                              ),
                              SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/shoe 4.svg',
                                            height: 20,
                                            width: 51,
                                            color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Sneakers",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/shoe 4.svg',
                                            height: 20,
                                            width: 51,
                                            color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Chuck Taylor",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                            'assets/icons/shoe 4.svg',
                                            height: 20,
                                            width: 51,
                                            color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Hiking Boots",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                ],
                              )
                            ]),
                        SizedBox(
                          height: 10,
                        ),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text("OTHERS SHOES",
                                    style:
                                        caption.copyWith(color: neutralGrey2)),
                                margin: EdgeInsets.only(left: 24),
                              ),
                              SizedBox(height: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(TablerIcons.settings,
                                            size: 20, color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Settings",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(TablerIcons.help,
                                            size: 20, color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Help",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                  Container(
                                    child: Row(
                                      children: [
                                        Icon(TablerIcons.logout,
                                            size: 20, color: neutralGrey2),
                                        SizedBox(
                                          width: 18,
                                        ),
                                        Text("Log Out",
                                            style: subtitle2.copyWith(
                                                color: neutralGrey2)),
                                      ],
                                    ),
                                    padding: EdgeInsets.only(left: 24),
                                    margin: EdgeInsets.only(bottom: 14),
                                  ),
                                ],
                              )
                            ]),
                      ],
                    ),
                  ]),
            ),
          ),
        ),
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
                        Builder(builder: (context) {
                          return GestureDetector(
                            onTap: () => Scaffold.of(context).openDrawer(),
                            child: Icon(
                              TablerIcons.menu,
                              size: 24,
                              color: neutralBlack,
                            ),
                          );
                        }),
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
