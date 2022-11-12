class Banner {
  int? id;
  String? image;
  // Product? product;

  Banner({
    this.id,
    this.image,
    // this.product,
  });

  Banner.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    // product = Product.fromJson(json['product']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
