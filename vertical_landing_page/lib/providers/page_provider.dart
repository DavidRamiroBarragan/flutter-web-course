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

  goTo(int index) {
    window.history.pushState(null, 'none', '#/${_pages[index]}');
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
