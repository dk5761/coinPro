import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../resources/constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28.h, left: 8.w, right: 8.w),
      height: 8.h,
      width: 100.w,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.12),
            spreadRadius: -17,
            blurRadius: 22,
            offset: const Offset(1, 11), // changes position of shadow
          ),
        ],
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            cardElement(Icons.file_download_outlined, 'Withdraw'),
            cardElement(Icons.file_upload_outlined, 'Deposit'),
            cardElement(Icons.history, 'History'),
          ],
        ),
      ),
    );
  }

  Widget cardElement(IconData icon, String text) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: secondaryLightColor,
          size: 8.5.w,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 11),
        )
      ],
    );
  }
}
