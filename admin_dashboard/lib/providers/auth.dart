
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  String? _token;

  login(String email, String password){
    //TODO: Hacer petición Http.
    _token = 'k4534jk5bkfdsuh5345n3k45hkhfldskfs53453';

    //TODO: Navegar al Dashboard

    notifyListeners();
  }
}