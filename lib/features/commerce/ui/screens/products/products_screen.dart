import 'package:ecommerce/core/app_assets.dart';
import 'package:ecommerce/core/di/di.dart';
import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/commerce/ui/screens/products/cubit/products_cubit.dart';
import 'package:ecommerce/features/commerce/ui/screens/products/cubit/products_state.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/widgets/home_search_bar.dart';
import 'package:ecommerce/features/commerce/ui/screens/tabs/widgets/product_card.dart';
import 'package:ecommerce/features/common/widgets/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatefulWidget {
  final String? categoryId;
  final String? subCategoryId;

  const ProductsScreen({super.key, this.categoryId, this.subCategoryId});

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  final ProductsCubit cubit = getIt<ProductsCubit>();

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  void _fetchProducts() {
    cubit.getProducts(
      categoryId: widget.categoryId,
      subCategoryId: widget.subCategoryId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.primary),
            onPressed: () => Navigator.pop(context),
          ),
          title: Align(
            alignment: Alignment.centerLeft,
            child: Image.asset(
              AppAssets.logo,
              color: AppColors.blue,
              height: 28,
              fit: BoxFit.contain,
            ),
          ),
        ),
        body: Column(
          children: [
            const HomeSearchBar(),
            const SizedBox(height: 8),
            Expanded(
              child: BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state.productsApi.isLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }

                  if (state.productsApi.hasError) {
                    return ErrorView(
                      errorMessage: state.productsApi.errorMessage,
                      onRetry: _fetchProducts,
                    );
                  }

                  final products = state.productsApi.data ?? [];
                  if (products.isEmpty) {
                    return const Center(
                      child: Text(
                        'No products found',
                        style: TextStyle(
                          color: AppColors.grey,
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }

                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.68,
                        ),
                    itemCount: products.length,
                    itemBuilder: (context, index) {
                      final product = products[index];
                      return ProductCard(
                        product: product,
                        onTap: () {
                          // Navigate to product details if implemented
                        },
                        onFavoriteTap: () {
                          // Handle favorite toggle
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
