import 'package:injectable/injectable.dart';
import '../../../network/models/response/category/category_dm.dart';
import '../../domain/repository/entity/sub_category.dart';

@injectable
class SubCategoryMapper {
  SubCategory toEntity(CategoryDM? model) {
    return SubCategory(
      id: model?.sId ?? '',
      name: model?.name ?? '',
      slug: model?.slug,
      categoryId: model?.category,
      image: model?.image,
    );
  }

  List<SubCategory> toEntityList(List<CategoryDM>? models) {
    return models?.map((e) => toEntity(e)).toList() ?? [];
  }
}
