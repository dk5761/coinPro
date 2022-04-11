import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider1/providers/coin_list_provider.dart';
import 'package:provider1/resources/themes.dart';
import 'package:provider1/screens/navigator.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter/rendering.dart';

void showLayoutGuidelines() {
  debugPaintSizeEnabled = true;
}

void main() {
  runApp(const MyApp());
  // showLayoutGuidelines();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => CoinListProvider(),
          )
        ],
        child: MaterialApp(
          theme: lightThemeData(context),
          darkTheme: darkThemeData(context),
          home: const RootNavigator(),
        ),
      );
    });
  }
}
