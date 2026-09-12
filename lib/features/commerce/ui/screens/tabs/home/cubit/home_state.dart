import 'package:ecommerce/features/commerce/domain/repository/entity/category.dart';
import 'package:ecommerce/features/common/utils/resource.dart';

import '../../../../../domain/repository/entity/product.dart';

class HomeState {
  late Resource<List<Category>> categoriesApi;
  late Resource<List<Product>> productsApi;

  HomeState({required this.categoriesApi, required this.productsApi});

  HomeState.initial() {
    categoriesApi = Resource.initial();
    productsApi = Resource.initial();
  }

  HomeState copyWith({
    Resource<List<Category>>? categoriesApi,
    Resource<List<Product>>? productsApi,
  }) {
    return HomeState(
      categoriesApi: categoriesApi ?? this.categoriesApi,
      productsApi: productsApi ?? this.productsApi,
    );
  }
}
