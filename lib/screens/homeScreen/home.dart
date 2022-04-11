import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/providers/coin_list_provider.dart';
import 'package:provider1/resources/constants.dart';
import 'package:provider1/resources/data.dart';
import 'package:provider1/screens/homeScreen/home_portfolio.dart';
import 'package:provider1/screens/homeScreen/home_top.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) {
      Provider.of<CoinListProvider>(context, listen: false)
          .fetchData(listData());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colorBgLightTheme,
      body: SingleChildScrollView(
        child: Column(children: [HomeScreenTop(), HomePortfolio()]),
      ),
    );
  }
}
