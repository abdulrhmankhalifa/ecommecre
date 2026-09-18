import 'package:ecommerce/features/commerce/data/mappers/product_mapper.dart';
import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:injectable/injectable.dart';

import '../../../network/models/response/cart/cart_dm.dart';
import '../../domain/entity/cart.dart';

@injectable
class CartMapper {
  ProductMapper productMapper;
  CartMapper(this.productMapper);

  Cart mapCart(CartDM cart) {
    Map<String, Product> products = {};
    cart.cartEntries?.forEach((entry) {
      var product = productMapper.toEntity(entry.product!);
      product.cartQty = entry.count ?? 0;
      product.totalCartPrice = (product.cartQty * product.price);
      products.addAll({entry.product!.id!: product});
    });

    return Cart(totalCartPrice: cart.totalCartPrice ?? 0, products: products);
  }
}
