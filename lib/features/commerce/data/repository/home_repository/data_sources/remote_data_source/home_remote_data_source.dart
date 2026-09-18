import 'package:ecommerce/features/network/api_result.dart';
import 'package:ecommerce/features/network/models/response/category/categories_response.dart';
import 'package:ecommerce/features/network/models/response/product/products_response.dart';

abstract class HomeRemoteDataSource {
  Future<ApiResult<CategoriesResponse>> getCategories();
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? subCategoryId,
  });
  Future<ApiResult<CategoriesResponse>> getSubCategories(String categoryId);
}
