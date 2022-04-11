import 'package:flutter/material.dart';

import '../resources/constants.dart';

class PID extends StatelessWidget {
  final String percent;
  final String sign;
  final double? width;

  const PID({Key? key, required this.percent, required this.sign, this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
      decoration: BoxDecoration(
        color: sign == "positive"
            ? Colors.green.withOpacity(0.2)
            : Colors.red.withOpacity(0.2),
        borderRadius: const BorderRadius.all(
          Radius.circular(defaultBorderRadius),
        ),
      ),
      child: Center(
        child: Row(children: [
          sign == "positive"
              ? const Icon(
                  Icons.arrow_drop_up,
                  color: Colors.green,
                )
              : const Icon(
                  Icons.arrow_drop_down,
                  color: Colors.red,
                ),
          Text(
            "$percent",
            style: TextStyle(
              color: sign == "positive" ? Colors.green : Colors.red,
            ),
          )
        ]),
      ),
    );
  }
}
