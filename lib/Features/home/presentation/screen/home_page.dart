
import 'package:flutter/material.dart';

import '../../../../Core/Theme/app_palette.dart';
import '../../../cafeInfo/presentation/screens/info_page.dart';
import '../../../cart/presentation/screens/cart.dart';
import 'home_page_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  // List of pages for navigation
  final List<Widget> _pages = [
    HomePageContent(),
    Center(child: Text("Search Page", style: TextStyle(fontSize: 24))),
    Cart(),
    InfoPage(),
  ];

  // Method to handle tap on navigation items
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
        onTap: _onItemTapped,
          selectedItemColor: AppPalette.tealGreen,
          unselectedItemColor: Colors.grey,
          backgroundColor: AppPalette.primaryBackgroundColor,
          currentIndex: _selectedIndex,
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_rounded), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.search_rounded), label: "Search"),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_shopping_cart_rounded), label: "Cart"),
            BottomNavigationBarItem(
                icon: Icon(Icons.info_outline), label: "About Us"),
          ]),
    );
  }
}
