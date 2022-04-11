import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreenTile extends StatelessWidget {
  final Widget title;
  final Widget? subTitle;
  final Widget? trailing;

  const HomeScreenTile(
      {Key? key, required this.title, this.subTitle, this.trailing})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      // width: 100.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                title,
                subTitle ?? Container(),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                trailing ?? Container(),
              ],
            )
          ]),
    );
  }
}
