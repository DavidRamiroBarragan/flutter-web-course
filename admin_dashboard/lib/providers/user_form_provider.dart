import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class UserFormProvider extends ChangeNotifier {
  Usuario? user;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  copyUserWith({
    String? rol,
    bool? estado,
    bool? google,
    String? nombre,
    String? correo,
    String? uid,
    String? img,
  }) {
    user = Usuario(
        rol: rol ?? user!.rol,
        estado: estado ?? user!.estado,
        google: google ?? user!.google,
        nombre: nombre ?? user!.nombre,
        correo: correo ?? user!.correo,
        uid: uid ?? user!.uid);

    notifyListeners();
  }

  bool _validate() {
    return formKey.currentState!.validate();
  }

  Future<void> updateUser() async {
    if (!_validate()) {
      return;
    }

    final data = {
      'nombre': user!.nombre,
      'correo': user!.correo
    };

    try {
      await CafeApi.httpPut('usuarios/${user!.uid}', data);
    } on DioError catch (e) {
      throw 'Error en el put ${e.message}';
    }
  }
}
