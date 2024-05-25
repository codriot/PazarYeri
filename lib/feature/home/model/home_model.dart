///  ButtonItem model class
class ButtonItem {
  ButtonItem({required this.text, required this.imagePath});
  final String text;
  final String imagePath;
}

/// Influencer Model sınıfı
class InfluencerItem {
  InfluencerItem({required this.image, required this.name});

  factory InfluencerItem.fromJson(Map<String, dynamic> json) {
    return InfluencerItem(
      image: json['image'] as String?,
      name: json['name'] as String?,
    );
  }

  final String? image;
  final String? name;

  Map<String, dynamic> toJson() {
    return {
      'image': image,
      'name': name,
    };
  }
}

class ProductItem {
  ProductItem({
    required this.productId,
    required this.code,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.dealer,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) {
    return ProductItem(
      productId: json['product_id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      price: json['price'] as double?,
      image: json['image'] as String?,
      dealer: json['dealer'] as String?,
      code: json['code'] as String?,
    );
  }
  final int? productId;
  final String? name;
  final String? description;
  final double? price;
  final String? image;
  final String? code;
  final String? dealer;

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'code': code,
      'dealer': dealer,
    };
  }
}
