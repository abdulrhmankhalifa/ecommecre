import 'package:ecommerce/features/network/models/response/product/product_dm.dart';

class CartEntry {
  int? count;
  String? sId;
  ProductDm? product;
  int? price;

  CartEntry({this.count, this.sId, this.product, this.price});

  CartEntry.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    sId = json['_id'];
    product = json['product'] != null
        ? ProductDm.fromJson(json['product'])
        : null;
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['count'] = count;
    data['_id'] = sId;
    if (product != null) {
      data['product'] = product!.toJson();
    }
    data['price'] = price;
    return data;
  }
}
