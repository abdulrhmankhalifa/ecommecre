import 'package:ecommerce/features/commerce/data/mappers/category_mapper.dart';
import 'package:ecommerce/features/commerce/data/mappers/product_mapper.dart';
import 'package:ecommerce/features/commerce/data/mappers/sub_category_mapper.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/category.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/sub_category.dart';
import 'package:ecommerce/features/commerce/domain/repository/home_repository.dart';
import 'package:ecommerce/features/network/api_result.dart';
import 'package:injectable/injectable.dart';

import 'data_sources/remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  final HomeRemoteDataSource _homeRemoteDataSource;
  final CategoryMapper _categoryMapper;
  final ProductMapper _productMapper;
  final SubCategoryMapper _subCategoryMapper;

  HomeRepositoryImpl(
    this._homeRemoteDataSource,
    this._categoryMapper,
    this._productMapper,
    this._subCategoryMapper,
  );

  @override
  Future<ApiResult<List<Category>>> getCategories() async {
    try {
      var response = await _homeRemoteDataSource.getCategories();

      return SuccessApiResult(
        data: _categoryMapper.toEntityList(response.getData()?.categories),
      );
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }

  @override
  Future<ApiResult<List<Product>>> getProducts({
    String? categoryId,
    String? subCategoryId,
  }) async {
    try {
      var response = await _homeRemoteDataSource.getProducts(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      );

      return SuccessApiResult(
        data: _productMapper.toEntityList(response.getData()?.products),
      );
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }

  @override
  Future<ApiResult<List<SubCategory>>> getSubCategories(
    String categoryId,
  ) async {
    try {
      var response = await _homeRemoteDataSource.getSubCategories(categoryId);

      return SuccessApiResult(
        data: _subCategoryMapper.toEntityList(response.getData()?.categories),
      );
    } catch (e) {
      return ErrorApiResult(error: ServerError());
    }
  }
}
