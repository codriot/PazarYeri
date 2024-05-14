import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class RegistrationForm extends StatefulWidget {
  const RegistrationForm({super.key});

  @override
  _RegistrationFormState createState() => _RegistrationFormState();
}

class _RegistrationFormState extends State<RegistrationForm> {
  final _formKey = GlobalKey<FormState>();
  final List<String> genders = ['Male', 'Female', 'Other'];
  final List<String> educationLevels = [
    'High School',
    'Undergraduate',
    'Graduate',
    'PhD'
  ];
  final List<String> hobbies = ['Reading', 'Swimming', 'Running', 'Cycling'];

  String? firstName;
  String? lastName;
  String? gender;
  String? educationLevel;
  String? email;
  String? hobby;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('PAZARYERİ')),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _formSample(title: 'ADINIZ', onsave: firstName),
              _formSample(title: "SOYADINIZ", onsave: lastName),
              //! pin code textfield değil normal textfield alınacak
              _pinCodeTextfield(context),
              _dropDownButton(
                menuItem: genders,
                onSave: gender,
                title: 'CINSIYET',
              ),
              _formSample(title: "EMAIL ADRESINIZ", onsave: email),
              _dropDownButton(
                  title: 'EGITIM SEVİYENİZ',
                  menuItem: educationLevels,
                  onSave: educationLevel),
              _dropDownButton(
                  title: "HOBİLERİNİZ", menuItem: hobbies, onSave: hobby),
              _SubmitButton(),
            ],
          ),
        ),
      ),
    );
  }

  Center _SubmitButton() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          final form = _formKey.currentState;
          if (form!.validate()) {
            form.save();
            // Todo: submit the form
          }
        },
        child: const Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Column _dropDownButton(
      {required String title,
      required List<String> menuItem,
      required onSave}) {
    return Column(
      children: [
        Text(title),
        DropdownButtonFormField(
          items: menuItem.map((menuItems) {
            return DropdownMenuItem(
              value: menuItems,
              child: Text(menuItems),
            );
          }).toList(),
          onChanged: (value) => setState(() => onSave = value),
          decoration: const InputDecoration(),
        ),
      ],
    );
  }

  PinCodeTextField _pinCodeTextfield(BuildContext context) {
    return PinCodeTextField(
      appContext: context,
      length: 3,
      obscureText: false,
      animationType: AnimationType.fade,
      pinTheme: PinTheme(shape: PinCodeFieldShape.box),
      animationDuration: const Duration(milliseconds: 300),
      onChanged: (value) {},
    );
  }

  Column _formSample({required String title, required onsave}) {
    return Column(
      children: [
        Text(title),
        TextFormField(
          decoration: const InputDecoration(),
          onSaved: (value) => onsave = value,
        ),
      ],
    );
  }
}
