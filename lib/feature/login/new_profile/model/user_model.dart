/// This file contains the model class for the new user details.
class UserModel {
  UserModel({
    this.gender,
    this.firstName,
    this.lastName,
    this.hobbies,
    this.birthDate,
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
      emailAddress: json['emailAddress'] as String,
      educationStatus: json['educationStatus'] as String,
    );
  }
  String? gender;
  String? firstName;
  String? lastName;
  String? hobbies;
  String? birthDate;
  String? emailAddress;
  String? educationStatus;

  Map<String, dynamic> toJson() {
    return {
      'gender': gender,
      'firstName': firstName,
      'lastName': lastName,
      'hobbies': hobbies,
      'birthDate': birthDate,
      'emailAddress': emailAddress,
      'educationStatus': educationStatus,
    };
  }
}
