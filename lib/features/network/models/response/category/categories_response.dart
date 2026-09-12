import 'package:ecommerce/features/network/models/response/category/category_dm.dart';

import '../common/metadata.dart';

class CategoriesResponse {
  int? results;
  Metadata? metadata;
  List<CategoryDM>? categories;
  CategoriesResponse({this.results, this.metadata, this.categories});

  CategoriesResponse.fromJson(Map<String, dynamic> json) {
    results = json['results'];
    metadata = json['metadata'] != null
        ? Metadata.fromJson(json['metadata'])
        : null;
    if (json['data'] != null) {
      categories = <CategoryDM>[];
      json['data'].forEach((v) {
        categories!.add(CategoryDM.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] = results;
    if (metadata != null) {
      data['metadata'] = metadata!.toJson();
    }
    if (categories != null) {
      data['categories'] = categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
