import 'package:ecommerce/features/network/api_result.dart';

import 'entity/category.dart';
import 'entity/product.dart';
import 'entity/sub_category.dart';

abstract class HomeRepository {
  Future<ApiResult<List<Category>>> getCategories();
  Future<ApiResult<List<Product>>> getProducts({
    String? categoryId,
    String? subCategoryId,
  });
  Future<ApiResult<List<SubCategory>>> getSubCategories(String categoryId);
}
