import '../../../network/api_result.dart';
import '../entity/cart.dart';

abstract class CartRepository {
  Future<ApiResult<Cart>> getCart();
  Future<ApiResult<Cart>> addProductToCart(String productId);
  Future<ApiResult<Cart>> removeProductFromCart(String productId);
  Future<ApiResult<Cart>> updateCartQty(String productId, int count);
}
