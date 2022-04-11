import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ListItem extends StatelessWidget {
  final Widget title;
  final Widget? subtitle;
  final Widget? trailing;
  final Widget? leading;

  const ListItem(
      {Key? key,
      required this.title,
      this.subtitle,
      this.trailing,
      this.leading})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 0, right: 0),
      // width: 100.w,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              children: [
                leading ?? Container(),
                const SizedBox(
                  width: 10,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    title,
                    subtitle ?? Container(),
                  ],
                ),
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
