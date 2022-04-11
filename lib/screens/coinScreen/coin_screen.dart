import 'package:flutter/material.dart';
import 'package:provider1/models/coin_data.dart';
import 'package:provider1/resources/constants.dart';
import 'package:provider1/screens/coinScreen/chart.dart';

import '../../widgets/percentage.dart';

class CoinScreen extends StatelessWidget {
  final CoinData? item;
  const CoinScreen({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        titleTextStyle: const TextStyle(color: Colors.black),
        centerTitle: true,
        title: Text(
          item?.title as String,
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 15),
              child: const Icon(Icons.search))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: defaultPadding),
          width: MediaQuery.of(context).size.width,
          child: Column(children: [
            Image.asset(
              "lib/assets/images/${item?.image}",
              height: 120,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "${item?.amount}",
              style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: 88,
              child: PID(
                  percent: item?.percentage as String,
                  sign: item?.sign as String),
            ),
            Chart()
          ]),
        ),
      ),
    );
  }
}
