import 'package:ykapay/models/product_model.dart';

class Category {
  int? id;
  String? name;
  String? createdAt;
  String? updatedAt;
  // Product? product;

  Category({
    this.id,
    this.name,
    this.createdAt,
    this.updatedAt,
    // this.product,
  });

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    // product = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
