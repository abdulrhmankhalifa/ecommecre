import 'package:ecommerce/core/theme/colors.dart';
import 'package:flutter/material.dart';

class HomeSearchBar extends StatelessWidget {
  final VoidCallback? onCartPressed;
  final ValueChanged<String>? onChanged;

  const HomeSearchBar({
    super.key,
    this.onCartPressed,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: AppColors.primary,
                  width: 1.2,
                ),
              ),
              child: TextField(
                onChanged: onChanged,
                decoration: const InputDecoration(
                  hintText: 'what do you search for?',
                  hintStyle: TextStyle(
                    color: Color(0x99004182),
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primary,
                    size: 26,
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 12.0),
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          IconButton(
            onPressed: onCartPressed,
            icon: const Icon(
              Icons.shopping_cart_outlined,
              color: AppColors.primary,
              size: 28,
            ),
          ),
        ],
      ),
    );
  }
}
