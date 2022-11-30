import 'package:admin_dashboard/providers/auth.dart';
import 'package:flutter/material.dart';

class LoginFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final AuthProvider authProvider;

  String email = '';
  String password = '';

  LoginFormProvider(this.authProvider);

  void validateForm() {
    var isValid = formKey.currentState!.validate();

    if (isValid) {
      authProvider.login(email, password);
      print('El formulario es válido');
    }
  }
}