import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/common/widgets/error_view.dart';
import 'package:flutter/material.dart';

import '../../../../../domain/repository/entity/category.dart';
import '../cubit/category_state.dart';
import 'category_banner_widget.dart';
import 'sub_category_item_widget.dart';

class SubCategoriesList extends StatelessWidget {
  final CategoryState state;
  final VoidCallback onRetry;

  const SubCategoriesList({
    super.key,
    required this.state,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final selectedCategory = state.selectedCategory;

    return Padding(
      padding: const EdgeInsets.only(right: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (selectedCategory != null) ...[
            CategoryBannerWidget(category: selectedCategory),
            const SizedBox(height: 16),
          ],
          Expanded(
            child: _buildSubCategoriesGrid(selectedCategory),
          ),
        ],
      ),
    );
  }

  Widget _buildSubCategoriesGrid(Category? selectedCategory) {
    if (state.subCategoriesApi.isLoading) {
      return const Center(
        child: CircularProgressIndicator(color: AppColors.primary),
      );
    }

    if (state.subCategoriesApi.hasError) {
      return ErrorView(
        errorMessage: state.subCategoriesApi.errorMessage,
        onRetry: onRetry,
      );
    }

    final subCategories = state.subCategoriesApi.data ?? [];
    if (subCategories.isEmpty) {
      return const Center(
        child: Text(
          'No subcategories found for this category',
          textAlign: TextAlign.center,
          style: TextStyle(color: AppColors.grey),
        ),
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.only(bottom: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.72,
      ),
      itemCount: subCategories.length,
      itemBuilder: (context, index) {
        final subCategory = subCategories[index];
        return SubCategoryItemWidget(
          subCategory: subCategory,
          onTap: () {
            Navigator.push(
              context,
              AppRouter.productsScreen(
                categoryId: selectedCategory?.id,
                subCategoryId: subCategory.id,
              ),
            );
          },
        );
      },
    );
  }
}
