import 'package:flutter/material.dart';

import '../../../../core/theme/colors.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onTap;

  const CustomBottomNavigationBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  static const List<IconData> _icons = [
    Icons.home_outlined,
    Icons.grid_view_outlined,
    Icons.favorite_border_rounded,
    Icons.person_outline_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(_icons.length, (index) {
          final isSelected = selectedIndex == index;
          return GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              padding: isSelected
                  ? const EdgeInsets.all(10)
                  : const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.white : AppColors.transparent,
                shape: BoxShape.circle,
              ),
              child: Icon(
                _icons[index],
                color: isSelected ? AppColors.primary : AppColors.white,
                size: 28,
              ),
            ),
          );
        }),
      ),
    );
  }
}
