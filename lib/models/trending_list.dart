import 'package:provider1/models/coin_data.dart';

class CoinList {
  List<CoinData>? list;
  final data = <CoinData>[];

  CoinList({required this.list});

  CoinList.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      json['data'].forEach((v) {
        data.add(CoinData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> list = <String, dynamic>{};
    if (data.isNotEmpty) {
      list['data'] = data.map((v) => v.toJson()).toList();
    }
    return list;
  }
}
