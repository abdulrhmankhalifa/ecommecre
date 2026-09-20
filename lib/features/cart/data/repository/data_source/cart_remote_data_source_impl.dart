import 'package:ecommerce/features/cart/data/repository/data_source/cart_remote_data_source.dart';
import 'package:ecommerce/features/network/api/api_services.dart';
import 'package:ecommerce/features/network/api_result.dart';
import 'package:ecommerce/features/network/models/response/cart/cart_response.dart';
import 'package:ecommerce/features/network/utils/handle_dio_error.dart';
import 'package:injectable/injectable.dart';

import '../../../../network/models/request/add_to_cart_request.dart';
import '../../../../network/models/request/update_cart_qty.dart';

@Injectable(as: CartRemoteDataSource)
class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  final ApiServices _apiServices;

  CartRemoteDataSourceImpl(this._apiServices);

  @override
  Future<ApiResult<CartResponse>> addProductToCart(String productId) async {
    try {
      await _apiServices.addToCart(AddToCartRequest(productId: productId));
      var response = await _apiServices.getCart();
      return SuccessApiResult(data: response);
    } catch (e) {
      return handelApiError(e);
    }
  }

  @override
  Future<ApiResult<CartResponse>> getCart() async {
    try {
      var response = await _apiServices.getCart();
      return SuccessApiResult(data: response);
    } catch (e) {
      return handelApiError(e);
    }
  }

  @override
  Future<ApiResult<CartResponse>> removeProductFromCart(
    String productId,
  ) async {
    try {
      var response = await _apiServices.removeItemFromCart(productId);
      return SuccessApiResult(data: response);
    } catch (e) {
      return handelApiError(e);
    }
  }

  @override
  Future<ApiResult<CartResponse>> updateCartQty(
    String productId,
    int count,
  ) async {
    try {
      var response = await _apiServices.updateCartQty(
        productId,
        UpdateCartQty(count: count.toString()),
      );
      return SuccessApiResult(data: response);
    } catch (e) {
      return handelApiError(e);
    }
  }
}
