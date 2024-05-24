class SearchedProductItem {
  SearchedProductItem({
    this.description,
    this.image,
    this.name,
    this.price,
    this.productId,
  });

  factory SearchedProductItem.fromJson(Map<String, dynamic> json) {
    return SearchedProductItem(
      description: json['description'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      price: json['price'] as double?,
      productId: json['product_id'] as int?,
    );
  }
  final String? description;
  final String? image;
  final String? name;
  final double? price;
  final int? productId;

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