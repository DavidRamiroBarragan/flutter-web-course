import 'package:flutter/cupertino.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorStateKey = GlobalKey<NavigatorState>();

  static navigateTo(String route){
    return navigatorStateKey.currentState?.pushNamed(route);
  }

  static replaceTo(String route){
    return navigatorStateKey.currentState!.pushReplacementNamed(route);
  }
}