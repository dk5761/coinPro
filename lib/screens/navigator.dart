import 'package:flutter/material.dart';
import 'package:provider1/screens/homeScreen/home.dart';
import 'package:provider1/screens/settings_screen.dart';
import 'package:provider1/screens/trendScreen/trend.dart';

class RootNavigator extends StatefulWidget {
  const RootNavigator({Key? key}) : super(key: key);

  @override
  State<RootNavigator> createState() => _RootNavigatorState();
}

class _RootNavigatorState extends State<RootNavigator> {
  // ignore: unused_field
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomeScreen(),
    TrendingScreen(),
    SettingScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0.0,
        unselectedFontSize: 0.0,
        items: [
          bottomItem(Icons.home_filled, "home"),
          bottomItem(Icons.note_add_sharp, "trends"),
          bottomItem(Icons.settings, "settings")
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color.fromARGB(255, 163, 255, 160),
        // selectedIconTheme: IconThemeData(color: Colors.green[300]),
        onTap: _onItemTapped,
      ),
    );
  }

  BottomNavigationBarItem bottomItem(IconData icon, String label) {
    return BottomNavigationBarItem(
        icon: Icon(
          icon,
        ),
        label: label);
  }
}
