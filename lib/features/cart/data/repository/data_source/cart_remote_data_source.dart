import 'package:ecommerce/features/network/api_result.dart';
import 'package:ecommerce/features/network/models/response/cart/cart_response.dart';

abstract class CartRemoteDataSource {
  Future<ApiResult<CartResponse>> getCart();
  Future<ApiResult<CartResponse>> addProductToCart(String productId);
  Future<ApiResult<CartResponse>> removeProductFromCart(String productId);
  Future<ApiResult<CartResponse>> updateCartQty(String productId, int count);
}
