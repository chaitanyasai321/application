import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './name.dart';

class UserName with ChangeNotifier {
  List<Name> _nameList = [
    Name("Maria Gracia", false),
    Name("James Johnson", false),
    Name("Robert Wilson", false),
    Name("Sruthi Tiwari", false),
    Name("Sai Chaitanya", false),
  ];

  List<Name> get names {
    return [..._nameList];
  }

  void checkOption(int index) {
    _nameList[index].check = !_nameList[index].check;
    notifyListeners();
  }

  void checks(int n) {
    if (n == 1) {
      for (int i = 0; i < _nameList.length; i++) {
        _nameList[i].check = true;
      }
    }
    if (n == 0) {
      for (int i = 0; i < _nameList.length; i++) {
        _nameList[i].check = false;
      }
    }
    notifyListeners();
  }

  void sendName(Name obj) {

    for (int i = 0; i < _nameList.length; i++) {
      if (obj == _nameList[i]) {
             _nameList[i].check=false;
            // break;
      }
      notifyListeners();
    }
  }
}
