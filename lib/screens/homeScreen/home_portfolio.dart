import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/models/coin_data.dart';
import 'package:provider1/providers/coin_list_provider.dart';
import 'package:provider1/resources/constants.dart';
import 'package:provider1/screens/coinScreen/coin_screen.dart';
import 'package:provider1/widgets/home_screen_tile.dart';

class HomePortfolio extends StatelessWidget {
  const HomePortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final clprovider = Provider.of<CoinListProvider>(context, listen: true);

    return clprovider.isLoading
        ? const Center(child: CircularProgressIndicator())
        : GridView.builder(
            padding:
                const EdgeInsets.only(top: 20, bottom: 20, left: 18, right: 18),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 250,
                childAspectRatio: 3 / 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20),
            itemCount: 4,
            itemBuilder: (ctx, index) {
              final item = clprovider.getCoinData(index);

              return gridPills(item, context);
            },
          );
  }

  Widget gridPills(CoinData? item, BuildContext context) {
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
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              spreadRadius: -2,
              blurRadius: 22,
              offset: const Offset(0, 0), // changes position of shadow
            ),
          ],
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            // margin: const EdgeInsets.only(top: 5, left: 0),
            child: Image.asset(
              "lib/assets/images/${item?.image}",
              height: 40,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            item?.title as String,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 6,
          ),
          HomeScreenTile(
            title: Text(
              "\$${item?.amount}",
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
            ),
            subTitle: item?.sign == "positive"
                ? Text(
                    "${item?.percentage}",
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.green),
                  )
                : Text(
                    "${item?.percentage}",
                    style: const TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w300,
                        color: Colors.red),
                  ),
            trailing: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: item?.sign == "positive"
                        ? Colors.green.withOpacity(0.2)
                        : Colors.red.withOpacity(0.2),
                    borderRadius: const BorderRadius.all(Radius.circular(22))),
                child: item?.sign == "positive"
                    ? const Icon(
                        Icons.trending_up,
                        color: Colors.green,
                        size: 20,
                      )
                    : const Icon(
                        Icons.trending_down,
                        color: Colors.red,
                        size: 20,
                      )),
          )
        ]),
      ),
    );
  }
}
