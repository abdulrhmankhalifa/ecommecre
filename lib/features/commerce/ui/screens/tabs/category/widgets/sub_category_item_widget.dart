import 'package:ecommerce/core/theme/colors.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/repository/entity/sub_category.dart';

class SubCategoryItemWidget extends StatelessWidget {
  final SubCategory subCategory;
  final VoidCallback? onTap;

  const SubCategoryItemWidget({
    super.key,
    required this.subCategory,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final hasImage =
        subCategory.image != null && subCategory.image!.isNotEmpty;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color(0xFFF6F6F6),
                border: Border.all(
                  color: const Color(0xFFE0E0E0),
                  width: 0.5,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: hasImage
                    ? Image.network(
                        subCategory.image!,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(
                          Icons.category_outlined,
                          color: AppColors.primary,
                          size: 32,
                        ),
                      )
                    : const Icon(
                        Icons.category_outlined,
                        color: AppColors.primary,
                        size: 32,
                      ),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subCategory.name,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: AppColors.textDark,
            ),
          ),
        ],
      ),
    );
  }
}
