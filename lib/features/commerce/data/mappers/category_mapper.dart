import 'package:ecommerce/features/commerce/domain/repository/entity/category.dart';
import 'package:ecommerce/features/network/models/response/category/category_dm.dart';
import 'package:injectable/injectable.dart';

@injectable
class CategoryMapper {
  Category toEntity(CategoryDM? categoryDm) {
    return Category(
      id: categoryDm?.sId ?? '',
      name: categoryDm?.name ?? '',
      image: categoryDm?.image ?? '',
    );
  }

  List<Category> toEntityList(List<CategoryDM>? categories) {
    return categories?.map((e) => toEntity(e)).toList() ?? [];
  }
}
