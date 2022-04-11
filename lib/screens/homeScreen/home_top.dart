// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider1/resources/constants.dart';
import 'package:provider1/screens/homeScreen/home_card.dart';
import 'package:provider1/widgets/home_screen_tile.dart';
import 'package:sizer/sizer.dart';

class HomeScreenTop extends StatelessWidget {
  const HomeScreenTop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;

    return Stack(
      children: [
        Container(
          height: 32.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xff0aa86c), Color(0xffa4e3c3)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Padding(
              padding: EdgeInsets.only(
                top: height + defaultPadding,
                left: defaultPadding + 2,
                right: defaultPadding + 2,
              ),
              child: Column(children: [
                HomeScreenTile(
                  title: Text(
                    "Welcome To",
                    style: GoogleFonts.nunito(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 24),
                    ),
                  ),
                  subTitle: Text(
                    "CoinPro",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  trailing: const Icon(
                    Icons.notifications,
                    color: Colors.white,
                  ),
                ),
                Container(height: 12),
                HomeScreenTile(
                  title: Text(
                    "My balance",
                    style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ),
                  subTitle: const Text(
                    "\$32,6672",
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold),
                  ),
                  trailing: portfolioIncDecrIcon(9.4, "positive"),
                ),
                Row(
                  children: const [
                    Icon(
                      Icons.trending_up,
                      color: Colors.white,
                    ),
                    Text(
                      '\$ 1896',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ])),
        ),
        const HomeCard()
      ],
    );
  }

  // portfolio increment /decrement icon
  Widget portfolioIncDecrIcon(double percent, String sign) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      decoration: BoxDecoration(
          color: sign == "positive"
              ? Colors.white.withOpacity(0.2)
              : Colors.red.withOpacity(0.2),
          borderRadius:
              const BorderRadius.all(Radius.circular(defaultBorderRadius))),
      child: Center(
        child: Row(children: [
          sign == "positive"
              ? const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.white,
                )
              : const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
          Text(
            "$percent",
            style: TextStyle(
              color: sign == "positive" ? Colors.white : Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
