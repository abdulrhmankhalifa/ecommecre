import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../common/utils/resource.dart';
import '../../../../domain/usecase/get_products_usecase.dart';
import 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetProductsUseCase _getProductsUseCase;

  ProductsCubit(this._getProductsUseCase) : super(ProductsState.initial());

  Future<void> getProducts({String? categoryId, String? subCategoryId}) async {
    emit(state.copyWith(productsApi: Resource.loading()));
    final apiResult = await _getProductsUseCase.call(
      categoryId: categoryId,
      subCategoryId: subCategoryId,
    );

    if (apiResult.isSuccess) {
      emit(
        state.copyWith(
          productsApi: Resource.success(data: apiResult.getData() ?? []),
        ),
      );
    } else {
      emit(
        state.copyWith(
          productsApi: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }
}
