import 'package:ecommerce/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_bottom_navigation_bar.dart';
import 'tabs/category/categories_tab.dart';
import 'tabs/home/home_tab.dart';
import 'tabs/profile/profile_tab.dart';
import 'tabs/wishlist/wishlist_tab.dart';

class MainTabsScreen extends StatefulWidget {
  const MainTabsScreen({super.key});

  @override
  State<MainTabsScreen> createState() => _MainTabsScreenState();
}

class _MainTabsScreenState extends State<MainTabsScreen> {
  int _selectedIndex = 0;

  final List<Widget> _tabs = const [
    HomeTab(),
    CategoriesTab(),
    WishlistTab(),
    ProfileTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: IndexedStack(index: _selectedIndex, children: _tabs),
      bottomNavigationBar: CustomBottomNavigationBar(
        selectedIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
