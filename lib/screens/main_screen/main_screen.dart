import 'package:flutter/material.dart';
import 'package:shopz/constants/color_constants.dart';
import 'package:shopz/screens/main_screen/pages/products_screen.dart';
import 'package:shopz/screens/main_screen/pages/checkout_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;
  final List _pages = [
    const ProductsScreen(),
    CheckoutScreen(),
  ];

  // function to update the selected index to enable page changes
  void _updateSelectedBottomNavIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.whiteColor,
      body: _pages[_selectedIndex],
      bottomNavigationBar: NavigationBar(
        height: 60,
        elevation: 0,
        backgroundColor: Colors.transparent,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          _updateSelectedBottomNavIndex(index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: "Products",
          ),
          NavigationDestination(
            icon: Icon(Icons.shopping_cart_outlined),
            selectedIcon: Icon(Icons.shopping_cart),
            label: "Checkout",
          )
        ],
      ),
    );
  }
}
