import 'package:ecommerce/features/network/models/response/cart/cart_entry.dart';

class CartDM {
  String? sId;
  String? cartOwner;
  List<CartEntry>? cartEntries;
  String? createdAt;
  String? updatedAt;
  int? iV;
  int? totalCartPrice;

  CartDM({
    this.sId,
    this.cartOwner,
    this.cartEntries,
    this.createdAt,
    this.updatedAt,
    this.iV,
    this.totalCartPrice,
  });

  CartDM.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    cartOwner = json['cartOwner'];
    if (json['products'] != null) {
      cartEntries = <CartEntry>[];
      json['products'].forEach((v) {
        cartEntries!.add(CartEntry.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
    totalCartPrice = json['totalCartPrice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['cartOwner'] = cartOwner;
    if (cartEntries != null) {
      data['products'] = cartEntries!.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['__v'] = iV;
    data['totalCartPrice'] = totalCartPrice;
    return data;
  }
}
