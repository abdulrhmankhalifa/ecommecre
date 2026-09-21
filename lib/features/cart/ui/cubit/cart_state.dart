import '../../../commerce/domain/repository/entity/product.dart';
import '../../../common/utils/resource.dart';
import '../../domain/entity/cart.dart';

class CartState {
  Resource<Cart> cartState;
  List<String> productIds = [];
  CartState({required this.cartState, this.productIds = const []});

  Product? getProductFromCart(String productId) {
    var cart = cartState.data;
    if (cart == null) {
      return null;
    }
    var product = cart.products[productId];
    return product;
  }

  CartState.initial() : cartState = Resource.initial();

  copyWith({Resource<Cart>? cartState, List<String>? productIds}) {
    return CartState(
      cartState: cartState ?? this.cartState,
      productIds: productIds ?? this.productIds,
    );
  }
}
