import 'package:flutter/material.dart';
import 'package:universal_html/html.dart';

class PageProvider extends ChangeNotifier {
  PageController pageController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int getIndex(String route) =>
      _pages.contains(route) ? _pages.indexOf(route) : 0;

  void createScrollController(String name) {
    pageController = PageController(initialPage: getIndex(name));
  }

  void goTo(int index) {
    window.history.pushState(null, 'none', '#/${_pages[index]}');
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
