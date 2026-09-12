import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../repository/entity/category.dart';
import '../repository/home_repository.dart';

@injectable
class GetCategoriesUseCase {
  final HomeRepository _homeRepository;
  GetCategoriesUseCase(this._homeRepository);

  Future<ApiResult<List<Category>>> call() => _homeRepository.getCategories();
}
