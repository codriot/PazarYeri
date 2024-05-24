import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/view/util/form_util.dart';
import 'package:turkiye_yazilim_staj/feature/login/new_profile/viewmodel/new_profile_model_view.dart';
import 'package:turkiye_yazilim_staj/product/widget/custom_appbar.dart';

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
      appBar: const CustomAppBar(isWhite: true),
      body: Form(
        key: controller.formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
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
              ElevatedButton(
                onPressed: () {
                  controller.saveData();

                  if (controller.formKey.currentState!.validate()) {
                    controller.formKey.currentState!.save();

                    // Add your logic to save data here (e.g., call an API, store in database)
                    print('Saved data:');
                    print('  First name: ${controller.model.firstName}');
                    print('  Last name: ${controller.model.lastName}');
                    print('  Date: ');
                    print('  Gender: ${controller.model.gender}');
                    print('  Email: ${controller.model.emailAddress}');
                    print(
                      '  Education level: ${controller.model.educationStatus}',
                    );
                    print('  Hobby: ${controller.model.hobbies}');

                    // You can also navigate to another page after saving
                    // Get.to(NextPage());
                  }
                },
                child: const Text('Gönder'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
