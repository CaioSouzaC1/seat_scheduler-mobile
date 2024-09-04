import 'package:flutter/material.dart';
import 'package:seat_scheduler_mobile/pages/bookings_page.dart';
import '../pages/home_page.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import '../pages/perfil_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = <Widget>[
    HomePage(),
    BookingsPage(),
    PerfilPage(),
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
