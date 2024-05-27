import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/model/person_detail.dart';
import 'package:turkiye_yazilim_staj/product/navigator/navigator.dart';
import 'package:turkiye_yazilim_staj/product/service/service_manager.dart';
import 'package:turkiye_yazilim_staj/product/util/storage/storage_util.dart';

/// Kayıt formu oluşturulurken kullanılacak olan controller mixin'i
class RegistrationController extends GetxController {
  /// İsim alanı kontrolcüsü
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController dayController = TextEditingController();
  TextEditingController monthController = TextEditingController();
  TextEditingController yearController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final List<String> genders = ['Erkek', 'Kadın', 'Diğer'];
  final List<String> educationLevels = [
    'Lise',
    'Universite',
    'Yuksek Lisans',
    'Doktora',
  ];
  final List<String> hobbies = ['Okuma', 'Yüzme', 'Koşu yapma', 'Seyahat etme'];

  /// Kullanıcı modeli
  UserModel model = UserModel();

  // Birleştirilmiş tarih
  RxString formattedDate = ''.obs;

  GlobalKey<FormState> get formKey => _formKey;

  @override
  void onInit() {
    super.onInit();
    dayController.addListener(updateFormattedDate);
    monthController.addListener(updateFormattedDate);
    yearController.addListener(updateFormattedDate);
  }

  @override
  void onClose() {
    // dispose Controllers
    firstnameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    dayController.dispose();
    monthController.dispose();
    yearController.dispose();
    super.onClose();
  }

  ///  Date Listeners
  void updateFormattedDate() {
    formattedDate.value =
        '${dayController.text}.${monthController.text}.${yearController.text}';
  }

  /// Date Formatter
  String formatDate(String date) {
    // Tarihi 'yyyy-MM-dd' formatından 'dd.MM.yyyy' formatına dönüştürme
    final parts = date.split('.');
    if (parts.length == 3) {
      // Günün, ayın ve yılın başında tek haneli sayılar varsa sıfır ekleyin
      final day = parts[2].padLeft(2, '0');
      final month = parts[1].padLeft(2, '0');
      final year = parts[0];
      return '$day.$month.$year';
    }
    Logger().e('Invalid date format: $date');
    throw const FormatException('Invalid date format');
  }

  /// date validation method
  String? validateDate() {
    final day = int.tryParse(dayController.text);
    final month = int.tryParse(monthController.text);
    final year = int.tryParse(yearController.text);

    if (day == null || month == null || year == null) {
      return 'Geçerli bir tarih giriniz';
    }

    if (day < 1 ||
        day > 31 ||
        month < 1 ||
        month > 12 ||
        year < 1900 ||
        year > DateTime.now().year) {
      return 'Geçerli bir tarih giriniz';
    }

    return null;
  }

  /// save data method
  Future<void> saveData() async {
    if (_formKey.currentState?.validate() ?? false) {
      model
        ..firstName = firstnameController.text
        ..lastName = lastNameController.text
        ..birthDate = formatDate(formattedDate.value)
        ..emailAddress = emailController.text;
      print(model);

      if (model.firstName != null &&
          model.lastName != null &&
          model.birthDate != null &&
          model.emailAddress != null &&
          model.educationStatus != null &&
          model.hobbies != null) {
        final response = await NetworkManager().postRequest(
          ServicePath.User.path,
          data: model.toJson(),
        );
        print(response);
        if (response.statusCode == 200) {
          final userId = response.data['user_id'];
          // user_id'yi GetStorage'a kaydet
          Logger().i('User ID: $userId');
          StorageUtil().setUserId(userId as int);
          Logger().i(
            "User ID GetStorage'a kaydedildi ${StorageUtil().getUserId()}",
          );
        }

        await Get.offAndToNamed(Navigate.main.route);
      } else {
        // print('Tüm model değişkenleri verilmemiş');
        Logger().e('Tüm model değişkenleri verilmemiş');
      }
    }
  }
}
