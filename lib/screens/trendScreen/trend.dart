import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/resources/constants.dart';
import 'package:provider1/widgets/home_screen_tile.dart';
import 'package:provider1/widgets/listItem.dart';
import 'package:provider1/widgets/percentage.dart';
import 'package:sizer/sizer.dart';
import '../../models/coin_data.dart';
import '../../providers/coin_list_provider.dart';
import '../coinScreen/coin_screen.dart';

class TrendingScreen extends StatelessWidget {
  const TrendingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).viewPadding.top;
    final provider = Provider.of<CoinListProvider>(context);

    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.only(
            top: height + 12, left: defaultPadding, right: defaultBorderRadius),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text("Coins List",
                    style:
                        TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                Icon(Icons.search),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                filterPills("All"),
                filterPills("24h"),
                filterPills("Top100"),
                filterPills("Marked Cap")
              ]),
            ),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 20, left: 5),
                  margin: const EdgeInsets.only(bottom: 12),
                  width: 90.w,
                  child: HomeScreenTile(
                    title: const Text(
                      "Marked Is Uptrend",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subTitle: Text(
                      "In the past 24hrs",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 18,
                          color: Colors.black.withOpacity(0.4)),
                    ),
                    trailing: const PID(percent: "9.17", sign: "positive"),
                  ),
                )
              ],
            ),
            Expanded(
                child: provider.isLoading
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                        itemCount: provider.length,
                        itemBuilder: (ctx, int index) {
                          final item = provider.getCoinData(index);

                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => CoinScreen(
                                      item: item,
                                    ),
                                  ));
                            },
                            child: listItem(item),
                          );
                        },
                      ))
          ],
        ),
      ),
    );
  }

  Widget filterPills(String text) {
    return Container(
      padding: const EdgeInsets.only(left: 12, right: 12, top: 3, bottom: 3),
      margin: const EdgeInsets.only(left: 12, right: 15, bottom: 12),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(12),
        ),
        color: const Color.fromARGB(255, 255, 255, 255),
        boxShadow: [
          BoxShadow(
            color: const Color.fromARGB(255, 0, 0, 0).withOpacity(0.1),
            spreadRadius: -8,
            blurRadius: 12,
            offset: const Offset(0, 12), // changes position of shadow
          ),
        ],
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget listItem(CoinData? item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 25),
      child: ListItem(
        leading: Image.asset(
          "lib/assets/images/${item?.image}",
          height: 40,
        ),
        title: Text(
          item?.title as String,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        subtitle: Text(
          item?.subtitle as String,
          style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
        ),
        trailing:
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(
            item?.amount as String,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 14),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.arrow_drop_up,
                color: item?.sign as String == 'positive'
                    ? Colors.green
                    : Colors.red,
              ),
              Text(
                item?.percentage as String,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: item?.sign as String == 'positive'
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          )
        ]),
      ),
    );
  }
}
