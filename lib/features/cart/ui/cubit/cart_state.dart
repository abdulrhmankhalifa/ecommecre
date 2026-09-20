import '../../../common/utils/resource.dart';
import '../../domain/entity/cart.dart';

class CartState {
  Resource<Cart> cartState;
  CartState({required this.cartState});

  bool isProductInCart(String productId) {
    var cart = cartState.data;
    if (cart == null) {
      return false;
    }
    var product = cart.products[productId];
    return product != null ? true : false;
  }

  CartState.initial() : cartState = Resource.initial();

  copyWith({Resource<Cart>? cartState}) {
    return CartState(cartState: cartState ?? this.cartState);
  }
}
