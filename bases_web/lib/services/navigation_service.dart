import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  Future navigateTo(String route) {
    return navigationKey.currentState!.pushNamed(route);
  }

  void goBack(String route){
    return navigationKey.currentState!.pop();
  }
}