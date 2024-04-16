import 'package:flutter/material.dart';

class ProductProvider extends ChangeNotifier {
  List<dynamic> _shoeSizes = [];
  List<dynamic> get shoeSizes => _shoeSizes;
  set shoeSizes(List<dynamic> newSizes) {
    _shoeSizes = newSizes;
    notifyListeners();
  }

  void toggleCheck(int index) {
    for (int i = 0; i < _shoeSizes.length; i++) {
      if (i == index) {
        _shoeSizes[i]["isSelected"] = !_shoeSizes[i]["isSelected"];
      } else {
        _shoeSizes[i]["isSelected"] = false;
      }
    }
    notifyListeners();
  }

  void unToggleCheck() {
    for (var i in _shoeSizes) {
      i["isSelected"] = false;
    }
    notifyListeners();
  }

  int _activePage = 0;
  int get activePage => _activePage;
  set activePage(int newIndex) {
    _activePage = newIndex;
    notifyListeners();
  }

  List<dynamic> _sizes = [];
  List<dynamic> get sizes => _sizes;
  set sizes(List<dynamic> newSizes) {
    _sizes = newSizes;
    notifyListeners();
  }
}
