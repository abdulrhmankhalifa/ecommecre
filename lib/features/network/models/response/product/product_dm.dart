import 'package:ecommerce/features/network/models/response/category/category_dm.dart';

class ProductDm {
  int? sold;
  List<String>? images;
  List<CategoryDM>? subcategory;
  int? ratingsQuantity;
  String? title;
  String? slug;
  String? description;
  int? quantity;
  int? price;
  String? imageCover;
  CategoryDM? category;
  CategoryDM? brand;
  double? ratingsAverage;
  String? createdAt;
  String? updatedAt;
  String? id;
  int? priceAfterDiscount;

  ProductDm({
    this.sold,
    this.images,
    this.subcategory,
    this.ratingsQuantity,
    this.title,
    this.slug,
    this.description,
    this.quantity,
    this.price,
    this.imageCover,
    this.category,
    this.brand,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.id,
    this.priceAfterDiscount,
  });

  ProductDm.fromJson(Map<String, dynamic> json) {
    sold = json['sold'];
    images = json['images']?.cast<String>();
    if (json['subcategory'] != null) {
      subcategory = <CategoryDM>[];
      json['subcategory'].forEach((v) {
        subcategory?.add(CategoryDM.fromJson(v));
      });
    }
    ratingsQuantity = json['ratingsQuantity'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    quantity = json['quantity'];
    price = json['price'];
    imageCover = json['imageCover'];
    category = json['category'] != null
        ? CategoryDM.fromJson(json['category'])
        : null;
    brand = json['brand'] != null ? CategoryDM.fromJson(json['brand']) : null;
    ratingsAverage = json['ratingsAverage']?.toDouble();
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    id = json['id'];
    priceAfterDiscount = json['priceAfterDiscount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sold'] = sold;
    data['images'] = images;
    if (subcategory != null) {
      data['subcategory'] = subcategory!.map((v) => v.toJson()).toList();
    }
    data['ratingsQuantity'] = ratingsQuantity;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['quantity'] = quantity;
    data['price'] = price;
    data['imageCover'] = imageCover;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    if (brand != null) {
      data['brand'] = brand!.toJson();
    }
    data['ratingsAverage'] = ratingsAverage;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['id'] = id;
    data['priceAfterDiscount'] = priceAfterDiscount;
    return data;
  }
}
