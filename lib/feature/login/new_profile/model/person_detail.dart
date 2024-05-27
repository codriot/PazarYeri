/// This file contains the model class for the new user details.
class UserModel {
  UserModel({
    this.gender,
    this.firstName,
    this.lastName,
    this.hobbies,
    this.birthDate,
    this.wallet = 0,
    this.emailAddress,
    this.educationStatus,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      gender: json['gender'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      hobbies: json['hobbies'] as String?,
      birthDate: (json['birthDate']) as String,
      wallet: json['wallet'] as int,
      emailAddress: json['emailAddress'] as String,
      educationStatus: json['educationStatus'] as String,
    );
  }
  String? gender;
  String? firstName;
  String? lastName;
  String? hobbies;
  String? birthDate;
  final credit_card = [];
  int? wallet;
  String? emailAddress;
  final cart = [];
  String? educationStatus;

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'firstName': firstName,
      'lastName': lastName,
      'hobbies': hobbies,
      'birthDate': birthDate,
      'credit_card': [],
      'wallet': wallet,
      'emailAddress': emailAddress,
      'cart': [],
      'educationStatus': educationStatus,
    };
  }
}
