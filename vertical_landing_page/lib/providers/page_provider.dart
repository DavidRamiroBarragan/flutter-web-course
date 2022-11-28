import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class PageProvider extends ChangeNotifier {
  PageController pageController = PageController();

  final List<String> _pages = [
    'home',
    'about',
    'pricing',
    'contact',
    'location'
  ];

  int _currentIndex = 0;

  int getPageIndex(String route) =>
      _pages.contains(route) ? _pages.indexOf(route) : 0;

  void createScrollController(String name) {
    pageController = PageController(initialPage: getPageIndex(name));

    pageController.addListener(() {
      final index = (pageController.page ?? 0).round();
      if (index != _currentIndex) {
        _currentIndex = index;
        html.window.history.pushState(null, 'none', '#/${_pages[index]}');
        html.document.title = 'Landing Page - ${_pages[index]}';
      }
    });
  }

  void goTo(int index) {
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
