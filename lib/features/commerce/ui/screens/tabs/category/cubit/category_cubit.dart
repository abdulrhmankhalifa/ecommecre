import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../common/utils/resource.dart';
import '../../../../../domain/repository/entity/category.dart';
import '../../../../../domain/usecase/get_categories_usecase.dart';
import '../../../../../domain/usecase/get_sub_categories_usecase.dart';
import 'category_state.dart';

@injectable
class CategoryCubit extends Cubit<CategoryState> {
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetSubCategoriesUseCase _getSubCategoriesUseCase;

  CategoryCubit(
    this._getCategoriesUseCase,
    this._getSubCategoriesUseCase,
  ) : super(CategoryState.initial());

  Future<void> loadCategories() async {
    emit(state.copyWith(categoriesApi: Resource.loading()));
    final apiResult = await _getCategoriesUseCase.call();

    if (apiResult.isSuccess) {
      final categories = apiResult.getData() ?? [];
      final firstCategory = categories.isNotEmpty ? categories.first : null;

      emit(
        state.copyWith(
          categoriesApi: Resource.success(data: categories),
          selectedCategory: firstCategory,
        ),
      );

      if (firstCategory != null) {
        loadSubCategories(firstCategory.id);
      }
    } else {
      emit(
        state.copyWith(
          categoriesApi: Resource.error(
            errorMessage: apiResult.errorMessage ?? 'Failed to load categories',
          ),
        ),
      );
    }
  }

  void selectCategory(Category category) {
    if (state.selectedCategory?.id == category.id) return;
    emit(state.copyWith(selectedCategory: category));
    loadSubCategories(category.id);
  }

  Future<void> loadSubCategories(String categoryId) async {
    emit(state.copyWith(subCategoriesApi: Resource.loading()));
    final apiResult = await _getSubCategoriesUseCase.call(categoryId);

    if (apiResult.isSuccess) {
      emit(
        state.copyWith(
          subCategoriesApi: Resource.success(data: apiResult.getData() ?? []),
        ),
      );
    } else {
      emit(
        state.copyWith(
          subCategoriesApi: Resource.error(
            errorMessage:
                apiResult.errorMessage ?? 'Failed to load subcategories',
          ),
        ),
      );
    }
  }
}
