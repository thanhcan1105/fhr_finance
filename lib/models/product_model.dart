import 'package:flutter/src/widgets/framework.dart';
import 'package:ykapay/models/category_model.dart';

final String tableProducts = 'products';

class ProductFields {
  static final List<String> values = [
    id,
    name,
    image,
    interest,
    isHot,
    isNew,
    categoryId,
    createdAt,
    updatedAt,
  ];

  static final String id = 'id';
  static final String name = 'name';
  static final String image = 'image';
  static final String interest = 'interest';
  static final String isHot = 'is_hot';
  static final String isNew = 'is_new';
  static final String categoryId = 'category_id';
  static final String createdAt = 'created_at';
  static final String updatedAt = 'updated_at';
}

class ProductModel {
  int? id;
  String? name;
  String? image;
  String? interest;
  int? isHot;
  int? isNew;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    this.id,
    this.name,
    this.image,
    this.interest,
    this.isHot,
    this.isNew,
    this.categoryId,
    this.createdAt,
    this.updatedAt,
  });

  ProductModel copy({
    int? id,
    String? name,
    String? image,
    String? interest,
    int? isHot,
    int? isNew,
    int? categoryId,
    String? createdAt,
    String? updatedAt,
    Category? category,
  }) =>
      ProductModel(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        interest: interest ?? this.interest,
        isHot: isHot ?? this.isHot,
        isNew: isNew ?? this.isNew,
        categoryId: categoryId ?? this.categoryId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'interest': interest,
      'isHot': isHot,
      'isNew': isNew,
      'categoryId': categoryId,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  // Implement toString to make it easier to see information about
  // each dog when using the print statement.
  @override
  String toString() {
    return 'Product{id: $id, name: $name, image: $image, interest: $interest, isHot: $isHot, isNew: $isNew, categoryId: $categoryId, createdAt: $createdAt, updatedAt: $updatedAt}';
  }

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] ?? '';
    image = json['image'];
    interest = json['interest'];
    isHot = json['is_hot'];
    isNew = json['is_new'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['interest'] = this.interest;
    data['is_hot'] = this.isHot;
    data['is_new'] = this.isNew;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }

  // static ProductModel fromJson(Map<String, Object?> json) => ProductModel(
  //       id: json[ProductFields.id] as int?,
  //       name: json[ProductFields.name] as String?,
  //       image: json[ProductFields.image] as String?,
  //       interest: json[ProductFields.interest] as String?,
  //       isHot: json[ProductFields.isHot] as int?,
  //       isNew: json[ProductFields.id] as int?,
  //       categoryId: json[ProductFields.categoryId] as int?,
  //       createdAt: json[ProductFields.id] as String?,
  //       updatedAt: json[ProductFields.updatedAt] as String?,
  //       category: json[ProductFields.category] as Category?,
  //     );

  // Map<String, Object?> toJson() => {
  //       ProductFields.id: id,
  //       ProductFields.name: name,
  //       ProductFields.image: image,
  //       ProductFields.interest: id,
  //       ProductFields.isHot: isHot,
  //       ProductFields.isNew: isNew,
  //       ProductFields.categoryId: categoryId,
  //       ProductFields.createdAt: createdAt,
  //       ProductFields.updatedAt: updatedAt,
  //       ProductFields.category: category,
  //     };

  map(StatelessWidget Function(dynamic e) param0) {}
}
