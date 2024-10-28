// lib/screens/navigation.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/NavigationProvider/navigation_provider.dart';
import '../Home/home.dart';
import '../Web_View/web_view.dart';


class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);

    // List of screens for bottom navigation
    final List<Widget> _screens = [
      const Home(),
      const WebView(),
    ];

    return Scaffold(
      body: _screens[navigationProvider.selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationProvider.selectedIndex,
        onTap: (index) => navigationProvider.setIndex(index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.web),
            label: 'WebView',
          ),
        ],
      ),
    );
  }
}
