import 'package:ecommerce/features/network/models/response/cart/cart_dm.dart';

class CartResponse {
  String? status;
  int? numOfCartItems;
  String? cartId;
  CartDM? cart;

  CartResponse({this.status, this.numOfCartItems, this.cartId, this.cart});

  CartResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    numOfCartItems = json['numOfCartItems'];
    cartId = json['cartId'];
    cart = json['data'] != null ? CartDM.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['numOfCartItems'] = numOfCartItems;
    data['cartId'] = cartId;
    if (cart != null) {
      data['data'] = cart!.toJson();
    }
    return data;
  }
}
