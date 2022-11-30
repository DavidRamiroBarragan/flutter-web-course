import 'package:admin_dashboard/providers/auth.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late AuthProvider authProvider;

  String email = '';
  String password = '';

  LoginFormProvider(this.authProvider);

  void validateForm() {
    var isValid = formKey.currentState!.validate();

    if (isValid) {
      print('El formulario es válido');
    }
  }
}