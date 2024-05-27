class CartModel {
  CartModel({
    required this.productId,
    required this.amount,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      productId: json['product_id'] as int,
      amount: json['amount'] as int,
    );
  }
  int? productId;
  int? amount;

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'amount': amount,
    };
  }
}
