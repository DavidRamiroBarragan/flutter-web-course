import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus status = AuthStatus.checking;

  AuthProvider() {
    isAuthenticated();
  }

  void login(String email, String password) {
    //TODO: Hacer petición Http.
    _token = 'k4534jk5bkfdsuh5345n3k45hkhfldskfs53453';
    LocalStorage.preferences.setString('token', _token!);

    //TODO: Navegar al Dashboard
    status = AuthStatus.authenticated;
    notifyListeners();

    NavigationService.replaceTo(Flurorouter.dashBoardRouter);
  }

  register(String email, String password, String name) {
    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.httpPost('/usuarios', data)
        .then((value) => print(value))
        .catchError((e) {});
    // LocalStorage.preferences.setString('token', _token!);

    //TODO: Navegar al Dashboard
    // status = AuthStatus.authenticated;
    // notifyListeners();
    //
    // NavigationService.replaceTo(Flurorouter.dashBoardRouter);
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.preferences.getString('token') == null) {
      status = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    //TODO: comprobar si el JSON token es válido

    Future.delayed(Duration(microseconds: 1000));
    status = AuthStatus.authenticated;
    notifyListeners();
    return true;
  }
}
