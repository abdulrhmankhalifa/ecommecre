import 'package:ecommerce/features/cart/domain/repository/cart_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../network/api_result.dart';
import '../entity/cart.dart';

@injectable
class GetCartUsecase {
  final CartRepository _cartRepository;
  GetCartUsecase(this._cartRepository);

  Future<ApiResult<Cart>> call() async {
    return _cartRepository.getCart();
  }
}
