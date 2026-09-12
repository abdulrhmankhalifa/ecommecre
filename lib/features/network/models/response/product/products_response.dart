import 'package:ecommerce/features/network/models/response/product/product_dm.dart';

import '../common/metadata.dart';

class ProductsResponse {
  int? results;
  Metadata? metadata;
  List<ProductDm>? products;

  ProductsResponse({this.results, this.metadata, this.products});

  ProductsResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      products = [];
      json['data'].forEach((v) {
        products?.add(ProductDm.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (products != null) {
      data['data'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
