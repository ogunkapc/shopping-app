import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // int _selectedIndex = 0;
  // final List _pages = const [
  //   ProductsScreen(),
  //   CheckoutScreen(),
  // ];

  // void _updateSelectedBottomNavIndex(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: _pages[_selectedIndex],
      // bottomNavigationBar: buildBottomNav(),
    );
  }

  
}
