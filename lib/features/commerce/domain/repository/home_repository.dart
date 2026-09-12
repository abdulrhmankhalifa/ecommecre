import 'package:ecommerce/features/network/api_result.dart';

import 'entity/category.dart';
import 'entity/product.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Product>>> getProducts();
}
