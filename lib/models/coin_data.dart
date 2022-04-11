class CoinData {
  String? title;
  String? subtitle;
  String? amount;
  String? percentage;
  String? sign;
  String? image;

  CoinData(
      {required this.title,
      required this.subtitle,
      required this.amount,
      required this.percentage,
      required this.sign,
      required this.image});

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'amount': amount,
        'percentage': percentage,
        'sign': sign,
        'image': image,
      };

  CoinData.fromJson(Map<String, dynamic> data) {
    title = data['title'];
    subtitle = data['subtitle'];
    amount = data['amount'];
    percentage = data['percentage'];
    sign = data['sign'];
    image = data['image'];
  }
}
