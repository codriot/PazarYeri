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
