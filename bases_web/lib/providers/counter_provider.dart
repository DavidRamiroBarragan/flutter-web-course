import 'package:flutter/material.dart';

class CounterProvider extends ChangeNotifier {
  int _counter = 15;

  get counter {
    return this._counter;
  }

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
