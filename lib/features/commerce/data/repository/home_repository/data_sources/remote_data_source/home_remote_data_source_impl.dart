import 'package:dio/dio.dart';
import 'package:ecommerce/features/commerce/data/repository/home_repository/data_sources/remote_data_source/home_remote_data_source.dart';
import 'package:ecommerce/features/network/api/api_services.dart';
import 'package:ecommerce/features/network/api_result.dart';
import 'package:ecommerce/features/network/models/response/category/categories_response.dart';
import 'package:ecommerce/features/network/models/response/product/products_response.dart';
import 'package:ecommerce/features/network/utils/handle_dio_error.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRemoteDataSource)
class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  final ApiServices _apiServices;
  HomeRemoteDataSourceImpl(this._apiServices);
  @override
  Future<ApiResult<CategoriesResponse>> getCategories() async {
    try {
      var result = await _apiServices.getCategories();
      return SuccessApiResult(data: result);
    } on DioException catch (e) {
      return handelApiError(e);
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }

  @override
  Future<ApiResult<ProductsResponse>> getProducts({
    String? categoryId,
    String? subCategoryId,
  }) async {
    try {
      var result = await _apiServices.getProducts(categoryId);
      return SuccessApiResult(data: result);
    } on DioException catch (e) {
      return handelApiError(e);
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }

  @override
  Future<ApiResult<CategoriesResponse>> getSubCategories(
    String categoryId,
  ) async {
    try {
      var result = await _apiServices.getSubCategoriesByCategories(categoryId);
      return SuccessApiResult(data: result);
    } on DioException catch (e) {
      return handelApiError(e);
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }
}
