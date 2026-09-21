import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/product_card.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class ProductsSection extends StatelessWidget {
  final String title;
  final VoidCallback? onViewAllTap;
  final Function(Product)? onProductTap;

  const ProductsSection({
    super.key,
    required this.title,
    this.onViewAllTap,
    this.onProductTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
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
        BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state.productsApi.isSuccess) {
              var products = state.productsApi.data ?? [];
              return SizedBox(
                height: 280,
                child: ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(width: 16),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    return ProductCard(
                      product: product,
                      onTap: () => onProductTap?.call(product),
                    );
                  },
                ),
              );
            } else if (state.productsApi.hasError) {
              return Center(
                child: Text(
                  state.productsApi.errorMessage,
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
