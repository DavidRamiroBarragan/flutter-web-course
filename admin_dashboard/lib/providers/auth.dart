import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/auth_response.dart';
import 'package:admin_dashboard/router/router.dart';
import 'package:admin_dashboard/services/local_storage.dart';
import 'package:admin_dashboard/services/navigation.dart';
import 'package:admin_dashboard/services/notifications.dart';
import 'package:flutter/material.dart';

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthProvider extends ChangeNotifier {
  String? _token;
  AuthStatus status = AuthStatus.checking;
  Usuario? user;

  AuthProvider() {
    isAuthenticated();
  }

  void login(String email, String password) {
    final data = {'correo': email, 'password': password};

    CafeApi.httpPost('/auth/login', data).then((value) {
      final response = AuthResponse.fromMap(value);
      user = response.usuario;
      status = AuthStatus.authenticated;
      LocalStorage.preferences.setString('token', response.token);
      NavigationService.replaceTo(Flurorouter.dashBoardRouter);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackBarError('Credenciales no validas');
    });
  }

  void register(String email, String password, String name) {
    final data = {'nombre': name, 'correo': email, 'password': password};

    CafeApi.httpPost('/usuarios', data).then((value) {
      final response = AuthResponse.fromMap(value);
      user = response.usuario;
      status = AuthStatus.authenticated;
      LocalStorage.preferences.setString('token', response.token);
      NavigationService.replaceTo(Flurorouter.dashBoardRouter);
      CafeApi.configureDio();
      notifyListeners();
    }).catchError((e) {
      NotificationsService.showSnackBarError('Credenciales no validas');
    });
  }

  Future<bool> isAuthenticated() async {
    if (LocalStorage.preferences.getString('token') == null) {
      status = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }

    try {
      final response = await CafeApi.httpGet('/auth');
      final authResponse = AuthResponse.fromMap(response);

      user = authResponse.usuario;
      _token = authResponse.token;
      status = AuthStatus.authenticated;

      CafeApi.configureDio();
      notifyListeners();

      return true;
    } catch (e) {
      status = AuthStatus.notAuthenticated;
      notifyListeners();
      return false;
    }
  }

  void logout() {
    LocalStorage.preferences.remove('token');
    status = AuthStatus.notAuthenticated;
    notifyListeners();
  }
}
