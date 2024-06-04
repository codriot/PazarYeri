class WalletModel {
  WalletModel({this.wallet});

  WalletModel.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'] as int?;
  }
  int? wallet;

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['wallet'] = wallet;
    return data;
  }
}
