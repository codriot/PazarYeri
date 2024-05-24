class ProductItem {
  ProductItem({this.products});

  ProductItem.fromJson(Map<String, dynamic> json) {
    if (json['products'] != null) {
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(Products.fromJson(v as Map<String, dynamic>));
      });
    }
  }
  List<Products>? products;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Products {
  Products({
    this.description,
    this.image,
    this.name,
    this.price,
    this.productId,
  });

  Products.fromJson(Map<String, dynamic> json) {
    description = json['description'] as String;
    image = json['image'] as String;
    name = json['name'] as String;
    price = json['price'] as double;
    productId = json['product_id'] as int;
  }
  String? description;
  String? image;
  String? name;
  double? price;
  int? productId;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['description'] = description;
    data['image'] = image;
    data['name'] = name;
    data['price'] = price;
    data['product_id'] = productId;
    return data;
  }
}
