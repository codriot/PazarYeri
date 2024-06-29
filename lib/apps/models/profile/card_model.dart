class CreditCardModel {
  CreditCardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cvv,
    required this.expiryDate,
  });

  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      cardHolderName: json['card_holder_name'] as String,
      cardNumber: json['card_number'] as String,
      cvv: json['cvv'] as String,
      expiryDate: json['expiry_date'] as String,
    );
  }
  String? cardHolderName;
  String? cardNumber;
  String? cvv;
  String? expiryDate;

  Map<String, dynamic> toJson() {
    return {
      'card_number': cardNumber,
      'expiry_date': expiryDate,
      'card_holder_name': cardHolderName,
      'cvv': cvv,
    };
  }
}
