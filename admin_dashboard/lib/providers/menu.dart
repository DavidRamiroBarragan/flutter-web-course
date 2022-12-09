import 'package:flutter/material.dart';

class MenuProvider extends ChangeNotifier {
  static late AnimationController animationController;
  static bool isOpen = false;

  String _currentPage = '';

  String get currentPage {
    return _currentPage;
  }

  void setCurrentPageUrl(String url) {
    _currentPage = url;

    Future.delayed(const Duration(milliseconds: 100), () {
      notifyListeners();
    });
  }

  static Animation<double> movement = Tween<double>(begin: -250, end: 0)
      .animate(CurvedAnimation(
      parent: animationController, curve: Curves.easeInOut));

  static Animation<double> opacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeInOut));

  static void open() {
    isOpen = true;
    animationController.forward();
  }

  static void close() {
    isOpen = false;
    animationController.reverse();
  }

  static void toggle() {
    isOpen ? animationController.reverse() : animationController.forward();
    isOpen = !isOpen;
  }
}
