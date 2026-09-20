import 'package:ecommerce/features/cart/domain/usecases/get_cart_usecase.dart';
import 'package:ecommerce/features/cart/domain/usecases/update_cart_qty_usecase.dart';
import 'package:ecommerce/features/common/utils/resource.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/usecases/add_to_cart_usecase.dart';
import '../../domain/usecases/remove_from_cart_usecase.dart';
import 'cart_state.dart';

@Singleton()
class CartCubit extends Cubit<CartState> {
  final GetCartUsecase _getCartUsecase;
  final AddToCartUsecase _addToCartUsecase;
  final RemoveFromCartUsecase _removeFromCartUsecase;
  final UpdateCartQtyUsecase _updateCartQtyUsecase;

  CartCubit(
    this._getCartUsecase,
    this._addToCartUsecase,
    this._removeFromCartUsecase,
    this._updateCartQtyUsecase,
  ) : super(CartState.initial());
  Future<void> getCart() async {
    emit(state.copyWith(cartState: Resource.loading()));
    var apiResult = await _getCartUsecase.call();
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(cartState: Resource.success(data: apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(
          cartState: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }

  Future<void> addToCart(String productId) async {
    emit(state.copyWith(cartState: Resource.loading()));
    var apiResult = await _addToCartUsecase.call(productId);
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(cartState: Resource.success(data: apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(
          cartState: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }

  Future<void> removeFromCart(String productId) async {
    emit(state.copyWith(cartState: Resource.loading()));
    var apiResult = await _removeFromCartUsecase.call(productId);
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(cartState: Resource.success(data: apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(
          cartState: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }

  Future<void> updateProductQty(String productId, int count) async {
    emit(state.copyWith(cartState: Resource.loading()));
    var apiResult = await _updateCartQtyUsecase.call(productId, count);
    if (apiResult.isSuccess) {
      emit(
        state.copyWith(cartState: Resource.success(data: apiResult.getData())),
      );
    } else {
      emit(
        state.copyWith(
          cartState: Resource.error(errorMessage: apiResult.errorMessage),
        ),
      );
    }
  }
}
