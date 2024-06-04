import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/controller/new_profile_controller.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/new_profile_view.dart';
import 'package:turkiye_yazilim_staj/product/utility/project_util/const/colors.dart';

/// Kayıt formu oluşturulurken kullanılacak olan mixin
/// Bu mixin içerisinde kayıt formu oluşturulurken kullanılacak olan
/// metotlar ve değişkenler bulunmaktadır.
mixin RegistrationUtil on State<RegistrationForm> {
  /// email  kontrolü
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email adresi boş bırakılamaz';
    }
    if (!RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$')
        .hasMatch(value)) {
      return 'Geçerli bir email adresi giriniz';
    }
    return null;
  }

  /// İsim kontrolü
  String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'İsim boş bırakılamaz';
    }
    // İsim doğrulama mantığı buraya eklenebilir.
    return null;
  }

  /// Creates a drop down button with a title, menu items and a save function.
  Column dropDownButton({
    required String title,
    required List<String> menuItem,
    required void Function(String?) onSave,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        ),
        DropdownButtonFormField(
          items: menuItem.map((menuItems) {
            return DropdownMenuItem(
              value: menuItems,
              child: Text(menuItems),
            );
          }).toList(),
          onChanged: onSave,
          decoration: _myInputDecoration(),
        ),
      ],
    );
  }

  /// Creates a date input field with day, month and year.
  Column dateInput(BuildContext context) {
    final controller = Get.find<RegistrationController>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            'DOĞUM TARIHI',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        Row(
          children: [
            // Gün için TextField
            Expanded(
              child: TextFormField(
                maxLength: 2,
                controller: controller.dayController,
                decoration: _myInputDecoration(hintText: 'Gün'),
                keyboardType: TextInputType.number,
                validator: (value) => controller.validateDate(),
                textInputAction: TextInputAction.next,
              ),
            ),

            const SizedBox(width: 8),
            // Ay için TextField
            Expanded(
              child: TextFormField(
                maxLength: 2,
                controller: controller.monthController,
                decoration: _myInputDecoration(hintText: 'Ay'),
                keyboardType: TextInputType.number,
                validator: (value) => controller.validateDate(),
                textInputAction: TextInputAction.next,
              ),
            ),

            const SizedBox(width: 8),
            // Yıl için TextField
            Expanded(
              child: TextFormField(
                maxLength: 4,
                controller: controller.yearController,
                decoration: _myInputDecoration(hintText: 'Yıl'),
                keyboardType: TextInputType.number,
                validator: (value) => controller.validateDate(),
                textInputAction: TextInputAction.done,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  InputDecoration _myInputDecoration({String? hintText}) {
    return InputDecoration(
      contentPadding: const EdgeInsets.all(16),
      counterText: '',
      hintText: hintText,
      border: OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.circular(20),
      ),
      fillColor: ColorsProject.titanium,
      filled: true,
    );
  }

  /// Creates a form field with a title, input field and validation.
  Column formSample({
    required String title,
    required TextEditingController controller,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Text(title, style: Theme.of(context).textTheme.bodyMedium),
        ),
        TextFormField(
          // controller: ,
          decoration: _myInputDecoration(),
          textInputAction: TextInputAction.next,
          controller: controller,
          validator: validator,
        ),
      ],
    );
  }
}
