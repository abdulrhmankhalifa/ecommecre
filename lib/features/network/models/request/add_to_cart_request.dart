class AddToCartRequest {
  String? productId;

  AddToCartRequest({this.productId});

  AddToCartRequest.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['productId'] = productId;
    return data;
  }
}
