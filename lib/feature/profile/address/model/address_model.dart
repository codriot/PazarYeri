class AddressModel {
  AddressModel({
    required this.address,
    required this.addressName,
  });

  factory AddressModel.fromJson(Map<String, dynamic> json) {
    return AddressModel(
      address: json['address'] as String,
      addressName: json['address_name'] as String,
    );
  }
  final String? address;
  final String? addressName;

  Map<String, dynamic> toJson() => {
        'address': address,
        'address_name': addressName,
      };
}
