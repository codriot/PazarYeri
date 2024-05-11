// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:turkiye_yazilim_staj/feature/product_detail/model/dealer_model.dart';

class ProductDetailModel {
  String? id;
  String? name;
  double? price;
  String imagePath;
  String? description;
  String? description2;
  double? star;
  int? commentCount;
  List commentList;
  Dealer? dealer;

  ProductDetailModel(
      {this.id,
      this.name,
      this.price,
      required this.imagePath,
      this.description,
      this.description2,
      this.star,
      this.commentCount,
      required this.commentList,
      this.dealer});
}
