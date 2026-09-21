import 'package:flutter/material.dart';
import 'package:ecommerce/core/theme/colors.dart';

class QtyControlWidget extends StatelessWidget {
  const QtyControlWidget({
    super.key,
    required this.qty,
    required this.onPlusClick,
    required this.onMinusClick,
  });

  final int qty;
  final void Function(int) onPlusClick;
  final void Function(int) onMinusClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(50),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _CircleIconButton(
            icon: Icons.remove_circle_outline,
            onTap: () => onMinusClick(qty),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              '$qty',
              style: const TextStyle(
                color: AppColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          _CircleIconButton(
            icon: Icons.add_circle_outline,
            onTap: () => onPlusClick(qty),
          ),
        ],
      ),
    );
  }
}

class _CircleIconButton extends StatelessWidget {
  const _CircleIconButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(
        icon,
        color: AppColors.white,
        size: 28,
      ),
    );
  }
}
