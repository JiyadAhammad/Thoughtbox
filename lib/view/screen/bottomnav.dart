import 'package:flutter/material.dart';
import 'package:thoughtbox/view/screen/activity_screen.dart';
import 'package:thoughtbox/view/screen/home_screen.dart';

class BottomNavigationBArScreeen extends StatefulWidget {
  BottomNavigationBArScreeen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBArScreeen> createState() =>
      _BottomNavigationBArScreeenState();
}

class _BottomNavigationBArScreeenState
    extends State<BottomNavigationBArScreeen> {
  int _selectedIndex = 0;

  List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ActivityScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
            backgroundColor: Colors.white,
            icon: Icon(
              Icons.home,
              color: Colors.white,
            ),
            label: 'HOME',
            activeIcon: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search_off,
              color: Colors.white,
            ),
            label: 'ACTIVITY',
            activeIcon: Icon(
              Icons.search_off,
              color: Colors.white,
            ),
          ),
        ],
        onTap: (index) {
          setState(
            () {
              _selectedIndex = index;
            },
          );
        },
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
    );
  }
}
