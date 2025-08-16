import 'package:baahiTire_app/application/screens/favorites.dart';
import 'package:flutter/material.dart';
import 'package:baahiTire_app/application/screens/profileScreen..dart';
import 'package:baahiTire_app/application/screens/historyScreen.dart';
import 'package:baahiTire_app/application/screens/homeScreen.dart';

class CustomNavigationBar extends StatefulWidget {
  CustomNavigationBar({super.key});

  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    HistoryScreen(),
    Favorites(),
    ProfileScreen()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/home_un.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset('assets/images/home24.png',
              width: 24,
              height: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/wallet.png',
            width: 24,
            height: 24,
            ),
            activeIcon: Image.asset('assets/images/wallet21.png'),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/favorite2.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset(
                height: 24, width: 24, 'assets/images/favorite1.png'),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/images/person.png',
              width: 24,
              height: 24,
            ),
            activeIcon: Image.asset('assets/images/accoun1.png'),
            label: 'Account',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xffFF6501),
        unselectedItemColor: Color(0xff020066),
        onTap: _onItemTapped,
      ),
    );
  }
}
