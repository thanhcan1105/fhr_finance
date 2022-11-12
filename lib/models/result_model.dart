import 'package:flutter/src/widgets/framework.dart';
import 'package:ykapay/models/category_model.dart';

final String tableRecentSearch = 'recent_search';

class RecentSearchFields {
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

  static final String id = '_id';
  static final String name = 'name';
  static final String image = 'image';
  static final String interest = 'interest';
  static final String isHot = 'isHot';
  static final String isNew = 'isNew';
  static final String categoryId = 'category_i d';
  static final String createdAt = 'created_at';
  static final String updatedAt = 'updated_at';
}

class RecentSearchModel {
  int? id;
  String? name;
  String? image;
  String? interest;
  int? isHot;
  int? isNew;
  int? categoryId;
  String? createdAt;
  String? updatedAt;

  RecentSearchModel({
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

  RecentSearchModel copy({
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
      RecentSearchModel(
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
    return 'Product{id: $id, name: $name, image: $image, interest: $interest, isHot: $isHot, isNew: $isNew, categoryId: $categoryId, createdAt: $createdAt, updatedAt: $updatedAt,}';
  }

  // RecentSearchModel.fromJson(Map<String, dynamic> json) {
  //   id = json['id'];
  //   name = json['name'] ?? '';
  //   image = json['image'];
  //   interest = json['interest'];
  //   isHot = json['is_hot'];
  //   isNew = json['is_new'];
  //   categoryId = json['category_id'];
  //   createdAt = json['created_at'];
  //   updatedAt = json['updated_at'];
  //   category = Category.fromJson(json['category']);
  // }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['id'] = this.id;
  //   data['name'] = this.name;
  //   data['image'] = this.image;
  //   data['interest'] = this.interest;
  //   data['is_hot'] = this.isHot;
  //   data['is_new'] = this.isNew;
  //   data['category_id'] = this.categoryId;
  //   data['created_at'] = this.createdAt;
  //   data['updated_at'] = this.updatedAt;
  //   return data;
  // }

  static RecentSearchModel fromJson(Map<String, Object?> json) => RecentSearchModel(
        id: json[RecentSearchFields.id] as int?,
        name: json[RecentSearchFields.name] as String?,
        image: json[RecentSearchFields.image] as String?,
        interest: json[RecentSearchFields.interest] as String?,
        isHot: json[RecentSearchFields.isHot] as int?,
        isNew: json[RecentSearchFields.id] as int?,
        categoryId: json[RecentSearchFields.categoryId] as int?,
        createdAt: json[RecentSearchFields.id] as String?,
        updatedAt: json[RecentSearchFields.updatedAt] as String?,
      );

  Map<String, Object?> toJson() => {
        RecentSearchFields.id: id,
        RecentSearchFields.name: name,
        RecentSearchFields.image: image,
        RecentSearchFields.interest: id,
        RecentSearchFields.isHot: isHot,
        RecentSearchFields.isNew: isNew,
        RecentSearchFields.categoryId: categoryId,
        RecentSearchFields.createdAt: createdAt,
        RecentSearchFields.updatedAt: updatedAt,
      };

  map(StatelessWidget Function(dynamic e) param0) {}
}
