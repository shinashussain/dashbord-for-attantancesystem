import 'package:flutter/material.dart';

class HomePageProvider extends ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  String? _userId;
  String? get userId => _userId;

  void changeIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setUserId(String id) {
    _userId = id;
    notifyListeners();
  }
}
