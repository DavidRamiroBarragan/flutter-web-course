import 'package:admin_dashboard/services/local_storage.dart';
import 'package:flutter/material.dart';

enum AuthStatus {
  checking,
  autenticated,
  notAutenticated
}
class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus status = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  login(String email, String password) {
    //TODO: Hacer petición Http.
    _token = 'k4534jk5bkfdsuh5345n3k45hkhfldskfs53453';
    LocalStorage.preferences.setString('token', _token!);

    //TODO: Navegar al Dashboard

    notifyListeners();
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.preferences.getString('token') == null) {
      status = AuthStatus.notAutenticated;
      notifyListeners();
      return false;
    }

    //TODO: comprobar si el JSON token es válido

    Future.delayed(Duration(microseconds: 1000));
    status = AuthStatus.autenticated;
    notifyListeners();
    return true;
  }
}
