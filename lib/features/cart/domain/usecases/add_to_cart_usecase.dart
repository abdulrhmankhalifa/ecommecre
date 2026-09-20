import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../entity/cart.dart';
import '../repository/cart_repository.dart';

@injectable
class AddToCartUsecase {
  final CartRepository _cartRepository;
  AddToCartUsecase(this._cartRepository);

  Future<ApiResult<Cart>> call(String productId) async {
    return _cartRepository.addProductToCart(productId);
  }
}
