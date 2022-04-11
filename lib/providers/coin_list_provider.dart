import 'package:flutter/material.dart';
import 'package:provider1/models/coin_data.dart';
import 'package:provider1/models/trending_list.dart';

class CoinListProvider extends ChangeNotifier {
  CoinList? list;

  bool isLoading = true;

  Future<bool> fetchData(dynamic data) async {
    list = CoinList.fromJson(data);
    isLoading = false;
    notifyListeners();
    return true;
  }

  int? get length => list?.data.length;

  CoinData? getCoinData(int i) {
    return list?.data[i];
  }
}
