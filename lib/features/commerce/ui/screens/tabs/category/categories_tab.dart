import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/widgets/home_search_bar.dart';
import 'package:ecommerce/features/common/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/category_cubit.dart';
import 'cubit/category_state.dart';
import 'widgets/categories_list.dart';
import 'widgets/sub_categories_list.dart';

class CategoriesTab extends StatelessWidget {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<CategoryCubit>()..loadCategories(),
      child: const Scaffold(
        backgroundColor: AppColors.white,
        body: SafeArea(
          child: _CategoriesTabContent(),
        ),
      ),
    );
  }
}

class _CategoriesTabContent extends StatelessWidget {
  const _CategoriesTabContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 8.0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppAssets.logo,
              height: 28,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => const Text(
                'Route',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ),
        const HomeSearchBar(),
        const SizedBox(height: 8),
        Expanded(
          child: BlocBuilder<CategoryCubit, CategoryState>(
            builder: (context, state) {
              if (state.categoriesApi.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                );
              }

              if (state.categoriesApi.hasError) {
                return ErrorView(
                  errorMessage: state.categoriesApi.errorMessage,
                  onRetry: () {
                    context.read<CategoryCubit>().loadCategories();
                  },
                );
              }

              final categories = state.categoriesApi.data ?? [];
              if (categories.isEmpty) {
                return const Center(child: Text('No categories found'));
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Left Categories List Sidebar
                  CategoriesList(
                    categories: categories,
                    selectedCategory: state.selectedCategory,
                    onCategorySelected: (category) {
                      context.read<CategoryCubit>().selectCategory(category);
                    },
                  ),

                  const SizedBox(width: 12),

                  // Right SubCategories Panel
                  Expanded(
                    child: SubCategoriesList(
                      state: state,
                      onRetry: () {
                        if (state.selectedCategory != null) {
                          context
                              .read<CategoryCubit>()
                              .loadSubCategories(state.selectedCategory!.id);
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
