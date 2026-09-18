import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:ecommerce/features/common/utils/resource.dart';

class ProductsState {
  final Resource<List<Product>> productsApi;

  ProductsState({
    required this.productsApi,
  });

  factory ProductsState.initial() {
    return ProductsState(
      productsApi: Resource.initial(),
    );
  }

  ProductsState copyWith({
    Resource<List<Product>>? productsApi,
  }) {
    return ProductsState(
      productsApi: productsApi ?? this.productsApi,
    );
  }
}
