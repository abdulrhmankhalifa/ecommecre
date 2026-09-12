import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/category.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/home/cubit/home_cubit.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/home/cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/category_card.dart';

class CategoriesSection extends StatelessWidget {
  final VoidCallback? onViewAllTap;
  final Function(Category)? onCategoryTap;

  const CategoriesSection({super.key, this.onViewAllTap, this.onCategoryTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Categories',
                style: TextStyle(
                  color: AppColors.textDark,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: onViewAllTap,
                child: const Text(
                  'view all',
                  style: TextStyle(
                    color: AppColors.textDark,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.categoriesApi.isSuccess) {
              var categories = state.categoriesApi.data ?? [];
              return SizedBox(
                height: 280,
                child: GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 12,
                    childAspectRatio: 1.15,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return CategoryCard(
                      category: category,
                      onTap: () => onCategoryTap?.call(category),
                    );
                  },
                ),
              );
            } else if (state.categoriesApi.hasError) {
              return Center(
                child: Text(
                  state.categoriesApi.errorMessage,
                  style: TextStyle(color: AppColors.black),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      ],
    );
  }
}
