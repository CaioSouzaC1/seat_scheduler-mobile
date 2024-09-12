import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/pages/bookings_page.dart';
import 'package:seat_scheduler_mobile/pages/store_page.dart';
import '../pages/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pages/perfil_page.dart';

class MainScreen extends StatefulWidget {
  final int selectIndex;
  const MainScreen({
    super.key,
    required this.selectIndex,
  });

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    BookingsPage(),
    StorePage(),
    PerfilPage(),
  ];

  @override
  void initState() {
    _selectedIndex = widget.selectIndex;
    super.initState();
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text('Home'),
            selectedColor: Colors.blue[50],
            unselectedColor: Colors.red[200],
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.event_available_outlined),
            title: const Text('Reservas'),
            selectedColor: Colors.blue[50],
            unselectedColor: Colors.red[200],
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.store),
            title: const Text('Lojas'),
            selectedColor: Colors.blue[50],
            unselectedColor: Colors.red[200],
          ),
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: const Text('Perfil'),
            selectedColor: Colors.blue[50],
            unselectedColor: Colors.red[200],
          ),
        ],
        curve: Curves.ease,
        backgroundColor: Colors.redAccent[700],
      ),
    );
  }
}
