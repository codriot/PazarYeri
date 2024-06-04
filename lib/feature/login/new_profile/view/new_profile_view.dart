import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/controller/new_profile_controller.dart';
import 'package:turkiye_yazilim_staj/product/utility/page_util/form_util.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_app_bar.dart';

/// Registration form for user registration
class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  State<RegistrationForm> createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm>
    with RegistrationUtil {
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());

    return Scaffold(
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const CustomAppBarBuilder(
                hasNotificationButton: false,
              ),
              formSample(
                title: 'ADINIZ',
                controller: controller.firstnameController,
                validator: validateName,
              ),
              formSample(
                title: 'SOYADINIZ',
                controller: controller.lastNameController,
                validator: validateName,
              ),
              dateInput(context),
              dropDownButton(
                menuItem: controller.genders,
                onSave: (value) => controller.model.gender = value,
                title: 'CINSIYET',
              ),
              formSample(
                title: 'EMAIL ADRESINIZ',
                controller: controller.emailController,
                validator: validateEmail,
              ),
              dropDownButton(
                title: 'EGITIM SEVİYENİZ',
                menuItem: controller.educationLevels,
                onSave: (value) => controller.model.educationStatus = value,
              ),
              dropDownButton(
                title: 'HOBİLERİNİZ',
                menuItem: controller.hobbies,
                onSave: (value) => controller.model.hobbies = value,
              ),
              SizedBox(height: context.height * 0.06),
              _nextButton(controller, context),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _nextButton(
    RegistrationController controller,
    BuildContext context,
  ) {
    return ElevatedButton(
      onPressed: () async {
        if (controller.formKey.currentState!.validate()) {
          controller.formKey.currentState!.save();
          await controller.saveData();
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Get.width * 0.3,
          vertical: 8,
        ),
        child: Text(
          'Gönder',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Colors.white,
              ),
        ),
      ),
    );
  }
}
