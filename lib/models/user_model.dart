class UserModel {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? cccd;
  String? phone;
  String? status;
  String? collabCode;
  String? userCollab;
  String? createdAt;
  String? updatedAt;

  UserModel(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.cccd,
      this.phone,
      this.status,
      this.userCollab,
      this.collabCode,
      this.createdAt,
      this.updatedAt});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    emailVerifiedAt = json['email_verified_at'];
    cccd = json['cccd'];
    phone = json['phone'];
    status = json['status'];
    userCollab = json['collab_user'];
    collabCode = json['collab_code'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['cccd'] = this.cccd;
    data['phone'] = this.phone;
    data['status'] = this.status;
    data['collab_user'] = this.userCollab;
    data['collab_code'] = this.collabCode;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
