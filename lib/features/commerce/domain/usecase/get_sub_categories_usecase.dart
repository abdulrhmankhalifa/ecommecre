import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../repository/entity/sub_category.dart';
import '../repository/home_repository.dart';

@injectable
class GetSubCategoriesUseCase {
  final HomeRepository _homeRepository;

  GetSubCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<SubCategory>>> call(String categoryId) =>
      _homeRepository.getSubCategories(categoryId);
}
