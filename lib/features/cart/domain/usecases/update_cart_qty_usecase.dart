import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../entity/cart.dart';
import '../repository/cart_repository.dart';

@injectable
class UpdateCartQtyUsecase {
  final CartRepository _cartRepository;
  UpdateCartQtyUsecase(this._cartRepository);

  Future<ApiResult<Cart>> call(String productId, int count) async {
    return _cartRepository.updateCartQty(productId, count);
  }
}
