import 'package:banking_app/app/config/app_assets.dart';
import 'package:banking_app/app/config/app_colors.dart';
import 'package:flutter/material.dart';

import '../Home/home_screen.dart';




class BottomBar extends StatefulWidget {
  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    // CardScreen(),
    // BenefitsScreen(),
    // DiscoverScreen(),
  ];

  final List<String> _iconPaths = [
    AppImages.home,
    AppImages.card,
    AppImages.benifit,
    AppImages.menu,
  ];

  final List<String> _labels = ['Home', 'Card', 'Benefits', 'Discover'];

  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) => setState(() => _selectedIndex = index),
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primaryColor,
          unselectedItemColor: Color(0xff767676),
          items: List.generate(4, (index) {
            return BottomNavigationBarItem(
              icon: Image.asset(
                _iconPaths[index],
                width: 24,
                height: 24,
                color: _selectedIndex == index ? AppColors.primaryColor : Color(0xff767676),
              ),
              label: _labels[index],
            );
          }),
        ),
      );

  }
}
