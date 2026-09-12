class CategoryDM {
  String? sId;
  String? name;
  String? slug;
  String? image;
  String? createdAt;
  String? updatedAt;
  String? category;

  CategoryDM({
    this.sId,
    this.name,
    this.slug,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.category,
  });

  CategoryDM.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    category = json['category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = sId;
    data['name'] = name;
    data['slug'] = slug;
    data['image'] = image;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['category'] = category;
    return data;
  }
}
