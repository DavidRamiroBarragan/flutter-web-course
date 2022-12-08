

import 'package:admin_dashboard/api/cafe_api.dart';
import 'package:admin_dashboard/models/http/user_response.dart';
import 'package:admin_dashboard/models/user.dart';
import 'package:flutter/cupertino.dart';

class UserProvider extends ChangeNotifier {
  List<Usuario> users = [];
  bool isLoading = true;

  UserProvider(){
    getPaginatedUsers();
  }

  getPaginatedUsers() async{
  final response = await CafeApi.httpGet('/usuarios?limite=100&desde=0');
  final usersResp = UserResponse.fromMap(response);
  users = [...usersResp.usuarios];
  isLoading = false;
  notifyListeners();
  }
}