import 'package:ecommerce/features/commerce/domain/repository/home_repository.dart';
import 'package:ecommerce/features/network/api_result.dart';
import 'package:injectable/injectable.dart';

import '../repository/entity/product.dart';

@injectable
class GetProductsUseCase {
  final HomeRepository _homeRepository;
  GetProductsUseCase(this._homeRepository);

  Future<ApiResult<List<Product>>> call({
    String? categoryId,
    String? subCategoryId,
  }) =>
      _homeRepository.getProducts(
        categoryId: categoryId,
        subCategoryId: subCategoryId,
      );
}
