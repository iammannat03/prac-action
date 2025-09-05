import 'package:flutter/foundation.dart';

class Tasks extends ChangeNotifier {
  // initialise values
  int _counter = 0;

  // getter for values
  int get counter => _counter;

  // implementation functions with notifyListeners
  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}
