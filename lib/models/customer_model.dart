class CustomerModel {
  int? productId;
  String? nameCustomer;
  String? cccdCustomer;
  String? phoneCustomer;
  String? addressCustomer;
  String? genderCustomer;
  int? userId;
  String? updatedAt;
  String? createdAt;
  int? id;

  CustomerModel(
      {this.productId,
      this.nameCustomer,
      this.cccdCustomer,
      this.phoneCustomer,
      this.addressCustomer,
      this.genderCustomer,
      this.userId,
      this.updatedAt,
      this.createdAt,
      this.id});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    nameCustomer = json['name_customer'];
    cccdCustomer = json['cccd_customer'];
    phoneCustomer = json['phone_customer'];
    addressCustomer = json['address_customer'];
    genderCustomer = json['gender_customer'];
    userId = json['user_id'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['name_customer'] = this.nameCustomer;
    data['cccd_customer'] = this.cccdCustomer;
    data['phone_customer'] = this.phoneCustomer;
    data['address_customer'] = this.addressCustomer;
    data['gender_customer'] = this.genderCustomer;
    data['user_id'] = this.userId;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    return data;
  }
}
