import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/user_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;
  bool ascending = true;
  int? column;

  UserProvider() {
    getPaginatedUsers();
  }

  getPaginatedUsers() async {
    final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
    final usersResp = UserResponse.fromMap(response);
    users = [...usersResp.usuarios];
    isLoading = false;
    notifyListeners();
  }

  Future<Usuario> getUserByIdi(String uid) async {
    try {
      final response = await CafeApi.httpGet('/usuarios/$uid');
      isLoading = false;
      return Usuario.fromMap(response);
    } catch (e) {
      throw ('Error en la petición');
    }
  }

  void sortUsersByColumn<T>(Comparable<T> Function(Usuario user) getField) {
    users.sort((a, b) {
      final aValue = getField(a);
      final bValue = getField(b);

      return ascending
          ? Comparable.compare(aValue, bValue)
          : Comparable.compare(bValue, aValue);
    });
    ascending = !ascending;
    notifyListeners();
  }

  void refreshUsers(Usuario user) {
    users = users.map((e) {
      if (e.uid != user.uid) {
        return e;
      }
      return user;
    }).toList();
    notifyListeners();
  }
}
