import 'package:ecommerce/core/theme/colors.dart';
import 'package:ecommerce/core/widgets/qty_control_widget.dart';
import 'package:ecommerce/features/cart/ui/cubit/cart_cubit.dart';
import 'package:ecommerce/features/cart/ui/cubit/cart_state.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/di/di.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  final bool isFavorite;
  final VoidCallback? onTap;
  final VoidCallback? onFavoriteTap;

  const ProductCard({
    super.key,
    required this.product,
    this.isFavorite = false,
    this.onTap,
    this.onFavoriteTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 190,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            // ignore: deprecated_member_use
            color: AppColors.primary.withOpacity(0.3),
            width: 1.2,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Image Area with Favorite Icon
            Stack(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(14.0),
                  ),
                  child: Container(
                    height: 125,
                    width: double.infinity,
                    color: Colors.grey.shade100,
                    child: Image.network(
                      product.imageCover,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.image, size: 50, color: Colors.grey),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: InkWell(
                    onTap: onFavoriteTap,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Icon(
                        isFavorite ? Icons.favorite : Icons.favorite_border,
                        color: AppColors.primary,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // Bottom Product Details Area
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 8.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    product.description,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      color: AppColors.textDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      Text(
                        'EGP ${product.price}',
                        style: const TextStyle(
                          color: AppColors.textDark,
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      if (product.priceAfterDiscount > 0 &&
                          product.priceAfterDiscount != product.price) ...[
                        const SizedBox(width: 8),
                        Text(
                          '${product.priceAfterDiscount} EGP',
                          style: TextStyle(
                            // ignore: deprecated_member_use
                            color: AppColors.primary.withOpacity(0.6),
                            fontSize: 11,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Review (${product.ratingsAverage})',
                            style: const TextStyle(
                              color: AppColors.textDark,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            Icons.star,
                            color: Color(0xFFFFC107),
                            size: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Align(
                    alignment: Alignment.centerRight,
                    child: buildAddToCartButton(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildAddToCartButton() {
    var cubit = getIt<CartCubit>();
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.cartState.isLoading &&
            state.productIds.contains(product.id)) {
          return CircularProgressIndicator();
        }
        Product? cartProduct = state.getProductFromCart(product.id);
        return cartProduct == null
            ? InkWell(
                onTap: () {
                  cubit.addToCart(product.id);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.add, color: Colors.white, size: 20),
                ),
              )
            : QtyControlWidget(
                qty: cartProduct.cartQty,
                onPlusClick: (qty) {
                  cubit.updateProductQty(product.id, cartProduct.cartQty + 1);
                },
                onMinusClick: (qty) {
                  cubit.updateProductQty(product.id, cartProduct.cartQty - 1);
                },
              );
      },
    );
  }
}
