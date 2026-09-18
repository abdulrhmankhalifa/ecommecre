import 'package:ecommerce/features/common/utils/resource.dart';
import '../../../../../domain/repository/entity/category.dart';
import '../../../../../domain/repository/entity/sub_category.dart';

class CategoryState {
  final Resource<List<Category>> categoriesApi;
  final Resource<List<SubCategory>> subCategoriesApi;
  final Category? selectedCategory;

  CategoryState({
    required this.categoriesApi,
    required this.subCategoriesApi,
    this.selectedCategory,
  });

  factory CategoryState.initial() {
    return CategoryState(
      categoriesApi: Resource.initial(),
      subCategoriesApi: Resource.initial(),
      selectedCategory: null,
    );
  }

  CategoryState copyWith({
    Resource<List<Category>>? categoriesApi,
    Resource<List<SubCategory>>? subCategoriesApi,
    Category? selectedCategory,
  }) {
    return CategoryState(
      categoriesApi: categoriesApi ?? this.categoriesApi,
      subCategoriesApi: subCategoriesApi ?? this.subCategoriesApi,
      selectedCategory: selectedCategory ?? this.selectedCategory,
    );
  }
}
