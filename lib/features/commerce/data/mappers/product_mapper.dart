import 'package:ecommerce/features/commerce/domain/repository/entity/product.dart';
import 'package:ecommerce/features/network/models/response/product/product_dm.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductMapper {
  Product toEntity(ProductDm? productDm) {
    return Product(
      sold: productDm?.sold ?? 0,
      images: productDm?.images ?? [],
      ratingsQuantity: productDm?.ratingsQuantity ?? 0,
      title: productDm?.title ?? '',
      description: productDm?.description ?? '',
      quantity: productDm?.quantity ?? 0,
      price: productDm?.price ?? 0,
      imageCover: productDm?.imageCover ?? '',
      ratingsAverage: productDm?.ratingsAverage?.toDouble() ?? 0.0,
      id: productDm?.id ?? '',
      priceAfterDiscount: productDm?.priceAfterDiscount ?? 0,
    );
  }

  List<Product> toEntityList(List<ProductDm>? products) {
    return products?.map((e) => toEntity(e)).toList() ?? [];
  }
}
