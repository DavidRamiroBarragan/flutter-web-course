import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    print('$email === $password === $name');
    if(formKey.currentState != null) {
      print(formKey.currentState);
    }
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      print('Form valid ... Login');
      print('$email === $password === $name');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}
